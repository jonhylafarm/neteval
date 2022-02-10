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
    public class ProfesoresController : ControllerBase
    {
        private readonly AppDbContext context;
        public ProfesoresController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<ProfesoresController>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.profesores.ToList());
            } catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // GET api/<ProfesoresController>/5
        [HttpGet("{id}", Name = "GetProfesor")]
        public ActionResult Get(int id)
        {
            try
            {
                var info = context.profesores.FirstOrDefault(g => g.id == id);
                return Ok(info);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // POST api/<ProfesoresController>
        [HttpPost]
        public ActionResult Post([FromBody] Profesores profesor)
        {
            try
            {
                context.profesores.Add(profesor);
                context.SaveChanges();
                return CreatedAtRoute("GetProfesor", new { id = profesor.id }, profesor);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // PUT api/<ProfesoresController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Profesores profesor)
        {
            try
            {
                if (profesor.id == id)
                {
                    context.Entry(profesor).State = EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetProfesor", new { id = profesor.id }, profesor);
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

        // DELETE api/<ProfesoresController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var profesor = context.profesores.FirstOrDefault(g => g.id == id);
                if (profesor != null)
                {
                    context.profesores.Remove(profesor);
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
