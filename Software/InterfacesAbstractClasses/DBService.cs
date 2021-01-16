using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MissionPossible.Data;

namespace MissionPossible.Interfaces
{
    public abstract class DBService
    {
        protected string _connectionString;
        public DBService(string connectionString)
        {
            _connectionString = connectionString;
        }
        public abstract bool MissionCreate(MissionAdvanced mission);
        public abstract CountryIsolation GetCountryByIsolation();
        public abstract IEnumerable<MissionAdvanced> GetAllMissions();
    }
}
