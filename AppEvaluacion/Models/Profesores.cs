using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppEvaluacion.Models
{
    public class Profesores
    {
        [Key]
        public int id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string identificacion { get; set; }
        public int aula_id { get; set; }

    }
}
