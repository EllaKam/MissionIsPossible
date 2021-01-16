using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using MissionPossible.Data;
using MissionPossible.Interfaces;
using MissionPossible.Services;


namespace MissionPossible.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class Find_ClosestController : ControllerBase
    {
        private IMissionPossible _missionService;
        public Find_ClosestController(IMissionPossible missionService)
        {
            _missionService = missionService;
        }

        // POST Find_ClosestController
        [HttpPost]
        public async Task<ActionResult<Mission>> GetClosestMission(Position position)
        {
            try
            {
                if (position == null || !position.Validation())
                {
                    return BadRequest();
                }
                return await _missionService.GetClosestMission(position);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Get Closest Mission");
            }
        }
    }
}
