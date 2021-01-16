using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MissionPossible.Data;

namespace MissionPossible.Interfaces
{
    public interface IMissionPossible
    {
        Task<bool> MissionCreate(Mission mission);
        Task<CountryIsolation> GetCountryByIsolation();
        Task<Mission> GetClosestMission(Position position);
    }
}
