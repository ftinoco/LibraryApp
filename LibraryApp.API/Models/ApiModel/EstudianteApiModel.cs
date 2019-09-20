using LibraryApp.API.Models.Context;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class EstudianteApiModel
    {
        [DataMember]
        public int IdLector { get; set; }

        [DataMember]
        public string CI { get; set; }

        [DataMember]
        public string Nombre { get; set; }

        [DataMember]
        public string Direccion { get; set; }

        [DataMember]
        public string Carrera { get; set; }

        [DataMember]
        public int Edad { get; set; }
        
        public virtual ICollection<Prestamo> Prestamo { get; set; }
    }
}