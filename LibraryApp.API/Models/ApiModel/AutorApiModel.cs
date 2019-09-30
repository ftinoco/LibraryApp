using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class AutorApiModel
    {
        [Key]
        [DataMember]
        public int IdAutor { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Nombre { get; set; }

        [DataMember]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Campo Requerido")]
        public string Nacionalidad { get; set; }

        [IgnoreDataMember]
        public virtual ICollection<Libro> Libro { get; set; }
    }
}