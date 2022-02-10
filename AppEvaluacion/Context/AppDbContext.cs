using AppEvaluacion.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppEvaluacion.Context
{
    public class AppDbContext :DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
        {

        }

        public DbSet<Alumnos> alumnos { get; set; }
        public DbSet<Profesores> profesores { get; set; }
        public DbSet<Aulas> aulas { get; set; }
        public DbSet<Promedios> promedios { get; set; }
        public DbSet<Materias> materias { get; set; }
    }
}
