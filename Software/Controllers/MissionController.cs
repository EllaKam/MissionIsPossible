using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using MissionPossible.Interfaces;
using MissionPossible.Services;

namespace MissionPossible.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MissionController : ControllerBase
    {
        private IMissionPossible _missionService;

        public MissionController(IMissionPossible missionService)
        {
            _missionService = missionService;
        }

        [HttpPost]
        public async Task<ActionResult<bool>> MissionCreator(Mission mission)
        {
            try
            {
                if (mission == null)
                {
                    return BadRequest();
                }
                return await _missionService.MissionCreate(mission);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Mission Creator");
            }
        }
    }
}
