using AppEvaluacion.Context;
using AppEvaluacion.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AppEvaluacion.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromediosController : ControllerBase
    {
        private readonly AppDbContext context;
        public PromediosController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<PromediosController>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.promedios.ToList());
            } catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // GET api/<PromediosController>/5
        [HttpGet("{id}", Name = "GetPromedio")]
        public ActionResult Get(int id)
        {
            try
            {
                var info = context.promedios.FirstOrDefault(g => g.alumno_id == id);
                return Ok(info);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // POST api/<PromediosController>
        [HttpPost]
        public ActionResult Post([FromBody] Promedios promedio)
        {
            try
            {
                context.promedios.Add(promedio);
                context.SaveChanges();
                return CreatedAtRoute("GetPromedio", new { id = promedio.alumno_id }, promedio);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // PUT api/<PromediosController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Promedios promedio)
        {
            try
            {
                if (promedio.alumno_id == id)
                {
                    context.Entry(promedio).State = EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetPromedio", new { id = promedio.alumno_id }, promedio);
                } else
                {
                    return BadRequest();
                }
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // DELETE api/<PromediosController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var promedio = context.promedios.FirstOrDefault(g => g.alumno_id == id);
                if (promedio != null)
                {
                    context.promedios.Remove(promedio);
                    context.SaveChanges();
                    return Ok(id);
                }
                else
                {
                    return BadRequest();
                }

            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }
    }
}
