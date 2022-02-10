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
    public class MateriasController : ControllerBase
    {
        private readonly AppDbContext context;
        public MateriasController(AppDbContext context)
        {
            this.context = context;
        }
        // GET: api/<MateriasController>
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(context.materias.ToList());
            } catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // GET api/<MateriasController>/5
        [HttpGet("{id}", Name = "GetMateria")]
        public ActionResult Get(int id)
        {
            try
            {
                var info = context.materias.FirstOrDefault(g => g.id == id);
                return Ok(info);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // POST api/<MateriasController>
        [HttpPost]
        public ActionResult Post([FromBody] Materias materia)
        {
            try
            {
                context.materias.Add(materia);
                context.SaveChanges();
                return CreatedAtRoute("GetMateria", new { id = materia.id }, materia);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }

        // PUT api/<MateriasController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Materias materia)
        {
            try
            {
                if (materia.id == id)
                {
                    context.Entry(materia).State = EntityState.Modified;
                    context.SaveChanges();
                    return CreatedAtRoute("GetMateria", new { id = materia.id }, materia);
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

        // DELETE api/<MateriasController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
            {
                var materia = context.materias.FirstOrDefault(g => g.id == id);
                if (materia != null)
                {
                    context.materias.Remove(materia);
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
