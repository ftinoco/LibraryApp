using LibraryApp.API.Models.ApiModel;
using System.ComponentModel.DataAnnotations;

namespace LibraryApp.API.Models.Context
{
    [MetadataType(typeof(AuthorApiModel))]
    public partial class Autor
    {

    }

    [MetadataType(typeof(StudentApiModel))]
    public partial class Estudiante
    {

    }

    [MetadataType(typeof(BookApiModel))]
    public partial class Libro
    {

    }

    [MetadataType(typeof(LoanApiModel))]
    public partial class Prestamo
    {

    }
}