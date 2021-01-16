using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MissionPossible.Data
{
    public class Position 
    {
        public double Latitude { get; set; }
        public double Longitude { get; set; }

        public bool Validation()
        {
            return (Latitude >= Contances.MinLatitude
                    && Latitude <= Contances.MaxLatitude
                    && Longitude >= Contances.MinLongitude
                    && Longitude <= Contances.MaxLongitude);
        }

    }
}
