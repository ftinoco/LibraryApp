using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class EstudianteApiModel
    {
        [Key]
        [DataMember]
        public int IdLector { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string CI { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Nombre { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Direccion { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Carrera { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public int Edad { get; set; }
        
        public virtual ICollection<Prestamo> Prestamo { get; set; }
    }
}