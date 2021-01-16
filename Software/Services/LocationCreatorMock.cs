using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Threading.Tasks;
using MissionPossible.Data;
using MissionPossible.InterfacesAbstractClasses;

namespace MissionPossible.Services
{
    public class LocationCreatorMock:ILocationCreator
    {
        private Random _random = new Random();

        private double RandomNumberBetween(double minValue, double maxValue)
        {
            var next = _random.NextDouble();

            return minValue + (next * (maxValue - minValue));
        }

        public Position GetPosition(string CountryName, string Address)
        {
            return new Position()
            {
                Latitude = RandomNumberBetween(Contances.MaxLatitude, Contances.MinLatitude),
                Longitude = RandomNumberBetween(Contances.MaxLongitude, Contances.MinLongitude) 
            };
        }
    }
}
