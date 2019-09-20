using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class AutorApiModel
    {
        [DataMember]
        public int IdAutor { get; set; }

        [DataMember]
        public string Nombre { get; set; }

        [DataMember]
        public string Nacionalidad { get; set; }

        public virtual ICollection<Libro> Libro { get; set; }
    }
}