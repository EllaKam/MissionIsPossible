using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using MissionPossible.Interfaces;
using MissionPossible.Services;

namespace MissionPossible.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class Coutries_By_IsolationController : ControllerBase
    {
        private IMissionPossible _missionService;

        public Coutries_By_IsolationController(IMissionPossible missionService)
        {
            _missionService = missionService;
        }

        // GET /Coutries_By_IsolationController
        [HttpGet]
        public async Task<ActionResult<string>> Get()
        {
            try
            {
               var countryByIsolation = await _missionService.GetCountryByIsolation();
               return $"{countryByIsolation.Country} {countryByIsolation.AgentsCount}";
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Error Get County by isolation");
            }
        }
    }
}
