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
    public class AlumnosController : ControllerBase
    {
        private readonly AppDbContext context;
        public AlumnosController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<AlumnosController>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.alumnos.ToList());
            } catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // GET api/<AlumnosController>/5
        [HttpGet("{id}", Name = "GetAlumno")]
        public ActionResult Get(int id)
        {
            try
            {
                var info = context.alumnos.FirstOrDefault(g => g.id == id);
                return Ok(info);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // POST api/<AlumnosController>
        [HttpPost]
        public ActionResult Post([FromBody] Alumnos alumno)
        {
            try
            {
                context.alumnos.Add(alumno);
                context.SaveChanges();
                return CreatedAtRoute("GetAlumno", new { id = alumno.id }, alumno);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // PUT api/<AlumnosController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Alumnos alumno)
        {
            try
            {
                if (alumno.id == id)
                {
                    context.Entry(alumno).State = EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetAlumno", new { id = alumno.id }, alumno);
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

        // DELETE api/<AlumnosController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var alumno = context.alumnos.FirstOrDefault(g => g.id == id);
                if (alumno != null)
                {
                    context.alumnos.Remove(alumno);
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
