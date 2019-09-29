using LibraryApp.API.Models.Context;
using LibraryApp.Common;
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

namespace LibraryApp.API.Controllers
{
    public class StudentsController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();

        public async Task<HttpResponseMessage> GetStudents([FromUri] DataFilter filter)
        {
            List<Estudiante> lst = null;

            if (!string.IsNullOrWhiteSpace(filter.filter))
            {
                string strFilter = filter.filter.Trim().ToUpper();

                lst = await db.Estudiante.Where(x => x.Nombre.ToUpper().Trim().Contains(strFilter) ||
                                                 x.Direccion.ToUpper().Trim().Contains(strFilter) ||
                                                 x.CI.ToUpper().Trim().Contains(strFilter) ||
                                                 x.Carrera.ToUpper().Trim().Contains(strFilter)).ToListAsync();
            }
            else
                lst = await db.Estudiante.ToListAsync();


            return Request.CreateResponse(HttpStatusCode.OK, new Result<List<Estudiante>>()
            {
                StatusCode = HttpStatusCode.OK,
                Data = lst
            });
        }

        [ResponseType(typeof(Estudiante))]
        public async Task<HttpResponseMessage> GetEstudiante(int id)
        {
            // AsNoTracking is defined for remove entity state
            Estudiante estudiante = await db.Estudiante.AsNoTracking().FirstOrDefaultAsync(x => x.IdLector == id);

            if (estudiante == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new Result<Estudiante>()
                {
                    StatusCode = HttpStatusCode.NotFound,
                    Message = string.Format("No se encontró registro con el id {0}", id)
                });
            }

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Estudiante>()
            {
                StatusCode = HttpStatusCode.OK,
                Data = estudiante
            });
        }

        // PUT: api/Students/5
        [ResponseType(typeof(void))]
        public async Task<HttpResponseMessage> PutEstudiante(int id, Estudiante estudiante)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);

            if (id != estudiante.IdLector)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, new BaseResult()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Message = string.Format("El campo clave de la entidad debe ser igual a {0}", id)
                });
            }

            if (EstudianteExists(id))
            {
            //    Estudiante record = await db.Estudiante.FindAsync(id);
            //    record.Nombre = estudiante.Nombre;
            //    record.Direccion = estudiante.Direccion;
            //    record.CI = estudiante.CI;
            //    record.Carrera = estudiante.Carrera;
            //    record.Edad = estudiante.Edad;

                db.Entry(estudiante).State = EntityState.Modified;
                try
                {
                    await db.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, new BaseResult()
                    {
                        ExceptionDetail = ex,
                        StatusCode = HttpStatusCode.BadRequest,
                        Message = string.Format("El campo clave de la entidad debe ser igual a {0}", id)
                    });
                }
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, new BaseResult()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Message = string.Format("No se encontró registro con el id {0}", id)
                });
            }

            return Request.CreateResponse(HttpStatusCode.NoContent);
        }

        // POST: api/Students
        [ResponseType(typeof(Estudiante))]
        public async Task<HttpResponseMessage> PostEstudiante(Estudiante estudiante)
        {
            if (!ModelState.IsValid)
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);

            db.Estudiante.Add(estudiante);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.Created, new Result<Estudiante>()
            {
                Data = estudiante,
                StatusCode = HttpStatusCode.Created,
                Message = "Registro creado exitosamente"
            });
        }

        // DELETE: api/Students/5
        [ResponseType(typeof(Estudiante))]
        public async Task<HttpResponseMessage> DeleteEstudiante(int id)
        {
            Estudiante estudiante = await db.Estudiante.FindAsync(id);
            if (estudiante == null)
                return Request.CreateResponse(HttpStatusCode.NotFound, new BaseResult()
                {
                    StatusCode = HttpStatusCode.BadRequest,
                    Message = string.Format("No se encontró registro con el id {0}", id)
                });

            db.Estudiante.Remove(estudiante);
            await db.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK, new Result<Estudiante>()
            {
                Data = estudiante,
                Message = "Se eliminó el registro exitosamente",
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

        private bool EstudianteExists(int id)
        {
            return db.Estudiante.Count(e => e.IdLector == id) > 0;
        }
    }
}