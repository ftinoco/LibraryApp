using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using LibraryApp.API.Models.Context;
using LibraryApp.Common;

namespace LibraryApp.API.Controllers
{ 
    [RoutePrefix("api/books")]
    public class BooksController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();
        
        [HttpGet]
        public async Task<HttpResponseMessage> GetLibro([FromUri] DataFilter filter)
        {
            List<Libro> books = null;

            if (!string.IsNullOrWhiteSpace(filter.filter))
            {
                string strFilter = filter.filter.Trim().ToUpper();

                books = await db.Libro.Where(x => x.Titulo.ToUpper().Trim().Contains(strFilter) ||
                                                 x.Area.ToUpper().Trim().Contains(strFilter) ||
                                                 x.Editorial.ToUpper().Trim().Contains(strFilter))
                                      .Include("Autor").ToListAsync();
            }
            else
                books = await db.Libro.Include("Autor").ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, new Result<List<Libro>>()
            {
                Data = books,
                StatusCode = HttpStatusCode.OK
            });
        }

        [HttpGet]
        [Route("getByAuthor/{id}")]
        [ResponseType(typeof(List<Libro>))]
        public async Task<HttpResponseMessage> ByAuthor(int id)
        {
            List<Libro> books = await db.Libro.AsNoTracking().Where(x => x.Autor.Any(y => y.IdAutor == id)).ToListAsync();
            if (books == null || books.Count == 0)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new Result<List<Libro>>()
                {
                    StatusCode = HttpStatusCode.NotFound,
                    Message = string.Format("No se encontraron libros del autor con el id {0}", id)
                });
            }

            return Request.CreateResponse(HttpStatusCode.OK, new Result<List<Libro>>()
            {
                Data = books,
                StatusCode = HttpStatusCode.OK
            });
        }

        [HttpGet]
        [Route("{id}")]
        [ResponseType(typeof(Libro))]
        public async Task<HttpResponseMessage> GetLibro(int id)
        {
            Libro book = await db.Libro.Include("Autor").FirstOrDefaultAsync(x => x.IdLibro == id);
            if (book == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new Result<Libro>()
                {
                    StatusCode = HttpStatusCode.NotFound,
                    Message = string.Format("No se encontró registro con el id {0}", id)
                });
            }

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Libro>()
            {
                Data = book,
                StatusCode = HttpStatusCode.OK
            });
        }

        [HttpPut]
        [Route("{id}")]
        [ResponseType(typeof(void))]
        public async Task<HttpResponseMessage> PutLibro(int id, Libro libro)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);


            if (id != libro.IdLibro)
                return Request.CreateResponse(HttpStatusCode.BadRequest, new BaseResult()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Message = string.Format("El campo clave de la entidad debe ser igual a {0}", id)
                });

            db.Entry(libro).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                if (!LibroExists(id))
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, new BaseResult()
                    {
                        StatusCode = HttpStatusCode.BadRequest,
                        Message = string.Format("No se encontró registro con el id {0}", id)
                    });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, new BaseResult()
                    {
                        ExceptionDetail = ex,
                        StatusCode = HttpStatusCode.InternalServerError,
                        Message = "Ocurrió un error en la operación"
                    });
                }
            }

            return Request.CreateResponse(HttpStatusCode.NoContent);
        }

        [ResponseType(typeof(Libro))]
        public async Task<HttpResponseMessage> PostLibro(Libro libro)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);

            db.Libro.Add(libro);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.Created, new Result<Libro>()
            {
                Data = libro,
                StatusCode = HttpStatusCode.Created,
                Message = "Registro creado exitosamente"
            });
        }

        [HttpDelete]
        [Route("{id}")]
        [ResponseType(typeof(Libro))]
        public async Task<HttpResponseMessage> DeleteLibro(int id)
        {
            Libro book = await db.Libro.FindAsync(id);
            if (book == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new BaseResult()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Message = string.Format("No se encontró registro con el id {0}", id)
                });
            }

            db.Libro.Remove(book);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Libro>()
            {
                Data = book,
                Message = "Registro eliminado",
                StatusCode = HttpStatusCode.OK
            });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LibroExists(int id)
        {
            return db.Libro.Count(e => e.IdLibro == id) > 0;
        }
    }
}