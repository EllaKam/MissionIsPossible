using GeoCoordinatePortable;
using MissionPossible.Data;
using MissionPossible.InterfacesAbstractClasses;

namespace MissionPossible.Services
{
    public class GeoCoordinateService :IGeoCoordinate
    {
        public double GetDistance(Position a, Position b)
        {
            GeoCoordinate from = new GeoCoordinate(a.Latitude, a.Longitude);
            GeoCoordinate to = new GeoCoordinate(b.Latitude, b.Longitude);
            return from.GetDistanceTo(to);
        }
    }
}
