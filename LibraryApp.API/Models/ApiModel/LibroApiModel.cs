using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class LibroApiModel
    {
        [DataMember]
        public int IdLibro { get; set; }

        [DataMember]
        public string Titulo { get; set; }

        [DataMember]
        public string Editorial { get; set; }

        [DataMember]
        public string Area { get; set; }
         
        public virtual ICollection<Prestamo> Prestamo { get; set; }
         
        public virtual ICollection<Autor> Autor { get; set; }
    }
}