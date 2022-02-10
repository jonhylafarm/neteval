using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppEvaluacion.Models
{
    public class Aulas
    {
        [Key]
        public int id { get; set; }
        public int numero { get; set; }
        public string edificio { get; set; }

    }
}
