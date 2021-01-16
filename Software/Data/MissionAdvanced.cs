using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MissionPossible.Data
{
    public class MissionAdvanced
    {

        public Mission Mission { get; set; }
        public Position Position { get; set; }
        public MissionAdvanced(Mission mission)
        {
            Mission = mission;
        }
    }
}
