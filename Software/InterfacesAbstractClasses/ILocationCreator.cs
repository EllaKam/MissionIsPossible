using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MissionPossible.Data;

namespace MissionPossible.InterfacesAbstractClasses
{
    public interface ILocationCreator
    {
        Position GetPosition(string CountryName, string Address);
    }
}
