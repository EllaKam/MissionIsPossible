using MissionPossible.Data;

namespace MissionPossible.InterfacesAbstractClasses
{
    public interface IGeoCoordinate
    {
        double GetDistance(Position a, Position b);
    }
}
