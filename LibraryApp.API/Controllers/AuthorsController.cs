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
    public class AuthorsController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();

        public async Task<HttpResponseMessage> GetAutor([FromUri] DataFilter filter)
        {
            List<Autor> authors = null;
            if (string.IsNullOrWhiteSpace(filter.filter))
            {
                string strFilter = filter.filter.Trim().ToUpper();

                authors = await db.Autor.Where(x => x.Nombre.ToUpper().Trim().Equals(strFilter) ||
                            x.Nacionalidad.ToUpper().Trim().Equals(strFilter))
                            .ToListAsync();
            }
            else
                authors = await db.Autor.ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, new Result<List<Autor>>()
            {
                Data = authors,
                StatusCode = HttpStatusCode.OK
            });
        }

        [ResponseType(typeof(Autor))]
        public async Task<HttpResponseMessage> GetAutor(int id)
        {
            Autor author = await db.Autor.FindAsync(id);
            if (author == null)
                return Request.CreateResponse(HttpStatusCode.NotFound, new Result<Autor>()
                {
                    Message = string.Format("No se encontró registro con el id {0}", id),
                    StatusCode = HttpStatusCode.NotFound
                });

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Autor>()
            {
                Data = author,
                StatusCode = HttpStatusCode.OK
            });
        }

        [ResponseType(typeof(void))]
        public async Task<HttpResponseMessage> PutAutor(int id, Autor autor)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);

            if (id != autor.IdAutor)
                return Request.CreateResponse(HttpStatusCode.BadRequest, new BaseResult()
                {
                    Message = string.Format("El campo clave de la entidad debe ser igual a {0}", id),
                    StatusCode = HttpStatusCode.BadRequest
                });

            db.Entry(autor).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                if (!AutorExists(id))
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, new Result<Autor>()
                    {
                        Message = string.Format("No se encontró registro con el id {0}", id),
                        StatusCode = HttpStatusCode.NotFound
                    });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, new Result<Autor>()
                    {
                        Message = "Ocurrió un error en la operación",
                        StatusCode = HttpStatusCode.InternalServerError,
                        ExceptionDetail = ex
                    });
                }
            }

            return Request.CreateResponse(HttpStatusCode.NoContent);
        }

        [ResponseType(typeof(Autor))]
        public async Task<HttpResponseMessage> PostAutor(Autor autor)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);

            db.Autor.Add(autor);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.Created, new Result<Autor>()
            {
                Data = autor,
                Message = "Registro creado",
                StatusCode = HttpStatusCode.Created
            });
        }

        [ResponseType(typeof(Autor))]
        public async Task<HttpResponseMessage> DeleteAutor(int id)
        {
            Autor author = await db.Autor.FindAsync(id);
            if (author == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new Result<Autor>()
                {
                    Message = string.Format("No se encontró registro con el id {0}", id),
                    StatusCode = HttpStatusCode.NotFound
                });
            }

            db.Autor.Remove(author);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Autor>()
            {
                Data = author,
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

        private bool AutorExists(int id)
        {
            return db.Autor.Count(e => e.IdAutor == id) > 0;
        }
    }
}