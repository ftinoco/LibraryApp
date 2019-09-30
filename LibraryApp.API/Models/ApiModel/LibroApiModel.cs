using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class LibroApiModel
    {
        [Key]
        [DataMember]
        public int IdLibro { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Titulo { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Editorial { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Area { get; set; }

        [IgnoreDataMember]
        public virtual ICollection<Prestamo> Prestamo { get; set; }

        [IgnoreDataMember]
        public virtual ICollection<Autor> Autor { get; set; }
    }
}