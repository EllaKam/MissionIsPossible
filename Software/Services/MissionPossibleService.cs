using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using MissionPossible.Data;
using MissionPossible.Interfaces;
using MissionPossible.InterfacesAbstractClasses;

namespace MissionPossible.Services
{
    public class MissionPossibleService : IMissionPossible
    {
        private DBService _dbService;
        private ILocationCreator _locationCreator;
        private IGeoCoordinate _iGeoCoordinate;
        public MissionPossibleService(DBService dbService, ILocationCreator locationCreator, IGeoCoordinate geoCoordinate)
        {
            _dbService = dbService;
            _locationCreator = locationCreator;
            _iGeoCoordinate = geoCoordinate;
        }
        public async Task<bool> MissionCreate(Mission mission)
        {
            MissionAdvanced missionAdvanced = new MissionAdvanced(mission);
            missionAdvanced.Position = _locationCreator.GetPosition(mission.Country, mission.Address);
            if (!missionAdvanced.Position.Validation())
            {
                return false;
            }
            return await  Task.Run(()=>_dbService.MissionCreate(missionAdvanced));
        }

        public async Task<CountryIsolation> GetCountryByIsolation()
        {
            return await Task.Run(() => _dbService.GetCountryByIsolation());
        }

        
        public async Task<Mission> GetClosestMission(Position position)
        { 
            var missions= await Task.Run( () => _dbService.GetAllMissions());
            var closed = await Task.Run(()=>
                missions.Aggregate((i1, i2) => ComparePosition(position, i1, i2)));
            return closed.Mission;
        }

        private MissionAdvanced ComparePosition(Position original, MissionAdvanced i1, MissionAdvanced i2)
        {
            return _iGeoCoordinate.GetDistance(original, i1.Position) < _iGeoCoordinate.GetDistance(original, i2.Position) ? i1 : i2;
        }
    }
}
