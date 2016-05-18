using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace aspnet_mysql_sample.Models
{
    public class Car
    {
        [Required]
        public int CarId { get; set; }

        [Required]
        [StringLength(45)]
        public string Model { get; set; }
        public int Year { get; set; }

        [StringLength(45)]
        public string Manufacturer { get; set; }
    }
}