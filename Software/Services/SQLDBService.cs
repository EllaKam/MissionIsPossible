using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using MissionPossible.Data;
using MissionPossible.Interfaces;

namespace MissionPossible.Services
{
    public class SQLDBService : DBService
    {
        public SQLDBService(string connectionString) : base(connectionString)
        {
        }

        public override bool MissionCreate(MissionAdvanced mission)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    using (SqlCommand command = new SqlCommand("CreateMission", connection))
                    {
                        command.Transaction = transaction;
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add("@CodeName", SqlDbType.VarChar).Value = mission.Mission.CodeName;
                        command.Parameters.Add("@CountryName", SqlDbType.VarChar).Value = mission.Mission.Country;
                        command.Parameters.Add("@Address", SqlDbType.VarChar).Value = mission.Mission.Address;
                        command.Parameters.Add("@DateStart", SqlDbType.DateTime).Value = mission.Mission.Date;
                        command.Parameters.Add("@Latitude", SqlDbType.Float).Value = mission.Position.Latitude;
                        command.Parameters.Add("@Longitude", SqlDbType.Float).Value = mission.Position.Longitude;
                        try
                        {
                            command.ExecuteNonQuery();
                            transaction.Commit();
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            return false;
                        }
                    }
                }
            }
            return true;
        }

        public override CountryIsolation GetCountryByIsolation()
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("GetCountryByIsolation", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            return null;
                        }

                        return new CountryIsolation
                        {
                            Country = reader.GetString(reader.GetOrdinal("CountryName")),
                            AgentsCount = reader.GetInt32(reader.GetOrdinal("IsolationCount"))
                        };
                    }
                }
            }
        }

        public override IEnumerable<MissionAdvanced> GetAllMissions()
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                string commandText = 
                    @"SELECT 
                     agnt.CodeName
                    ,cnt.CountryName
                    , ms.Address
                    , ms.DateStart
                    , ms.Latitude
                    , ms.Longitude
                    FROM Missions ms
                JOIN Agents agnt ON  ms.AgentId = agnt.AgentId
                JOIN Countries cnt ON ms.CountryId = cnt.CountryId";
                using (SqlCommand command = new SqlCommand(commandText, connection))
                {
                    command.CommandType = CommandType.Text;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Mission mission = new Mission()
                            {
                                Country = reader.GetString(reader.GetOrdinal("CountryName")),
                                CodeName = reader.GetString(reader.GetOrdinal("CodeName")),
                                Address = reader.GetString(reader.GetOrdinal("Address")),
                                Date = reader.GetDateTime(reader.GetOrdinal("DateStart")),
                            };
                            yield return new MissionAdvanced(mission)
                            {
                                Position = new Position()
                                {
                                    Latitude = reader.GetDouble(reader.GetOrdinal("Latitude")),
                                    Longitude = reader.GetDouble(reader.GetOrdinal("Longitude"))
                                }
                            };
                        }
                    }
                }
            }
        }
    }
}
