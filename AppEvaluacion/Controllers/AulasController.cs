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
    public class AulasController : ControllerBase
    {
        private readonly AppDbContext context;
        public AulasController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<AulasController>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.aulas.ToList());
            } catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}", Name = "GetAula")]
        public ActionResult Get(int id)
        {
            try
            {
                var info = context.aulas.FirstOrDefault(g => g.id == id);
                return Ok(info);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // POST api/<AulasController>
        [HttpPost]
        public ActionResult Post([FromBody] Aulas aula)
        {
            try
            {
                context.aulas.Add(aula);
                context.SaveChanges();
                return CreatedAtRoute("GetAula", new { id = aula.id }, aula);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // PUT api/<AulasController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Aulas aula)
        {
            try
            {
                if (aula.id == id)
                {
                    context.Entry(aula).State = EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetAula", new { id = aula.id }, aula);
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

        // DELETE api/<AulasController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var aula = context.aulas.FirstOrDefault(g => g.id == id);
                if (aula != null)
                {
                    context.aulas.Remove(aula);
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
