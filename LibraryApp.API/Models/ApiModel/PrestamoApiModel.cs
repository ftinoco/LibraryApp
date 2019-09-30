using LibraryApp.API.Models.Context;
using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class PrestamoApiModel
    {
        [Key]
        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public int IdLector { get; set; }

        [Key]
        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public int IdLibro { get; set; }

        [Key]
        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public DateTime FechaPrestamo { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public DateTime FechaDevolucion { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public bool Devuelto { get; set; }

        public virtual Estudiante Estudiante { get; set; }

        public virtual Libro Libro { get; set; }
    }
}