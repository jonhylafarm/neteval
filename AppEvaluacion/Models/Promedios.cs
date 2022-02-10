using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppEvaluacion.Models
{
    public class Promedios
    {
        [Key]
        public int alumno_id { get; set; }
        public float promedio { get; set; }

    }
}
