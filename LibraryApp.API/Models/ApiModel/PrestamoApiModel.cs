using LibraryApp.API.Models.Context;
using System;
using System.Runtime.Serialization;

namespace LibraryApp.API.Models.ApiModel
{
    public class PrestamoApiModel
    {
        [DataMember]
        public int IdLector { get; set; }

        [DataMember]
        public int IdLibro { get; set; }

        [DataMember]
        public DateTime FechaPrestamo { get; set; }

        [DataMember]
        public DateTime FechaDevolucion { get; set; }

        [DataMember]
        public bool Devuelto { get; set; }

        public virtual Estudiante Estudiante { get; set; }

        public virtual Libro Libro { get; set; }
    }
}