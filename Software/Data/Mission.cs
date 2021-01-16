using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MissionPossible.Data;

namespace MissionPossible
{
    public class Mission
    {
        public string CodeName { get; set; }
        public string Country { get; set; }
        public string Address { get; set; }
        public DateTime Date { get; set; }
    }
}
