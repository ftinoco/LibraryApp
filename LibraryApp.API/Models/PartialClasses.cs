using LibraryApp.API.Models.ApiModel;
using System.ComponentModel.DataAnnotations;

namespace LibraryApp.API.Models.Context
{
    [MetadataType(typeof(AutorApiModel))]
    public partial class Autor
    {

    }

    [MetadataType(typeof(EstudianteApiModel))]
    public partial class Estudiante
    {

    }

    [MetadataType(typeof(LibroApiModel))]
    public partial class Libro
    {

    }

    [MetadataType(typeof(PrestamoApiModel))]
    public partial class Prestamo
    {

    }
}