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
using LibraryApp.API.Models.ApiModel;
using Newtonsoft.Json;

namespace LibraryApp.API.Controllers
{
    public class StudentsController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();

        // GET: api/Students
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

        // GET: api/Students/5
        [ResponseType(typeof(Estudiante))]
        public async Task<IHttpActionResult> GetEstudiante(int id)
        {
            Estudiante estudiante = await db.Estudiante.FindAsync(id);
            if (estudiante == null)
            {
                return NotFound();
            }

            return Ok(estudiante);
        }

        // PUT: api/Students/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutEstudiante(int id, Estudiante estudiante)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != estudiante.IdLector)
            {
                return BadRequest();
            }

            db.Entry(estudiante).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstudianteExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Students
        [ResponseType(typeof(Estudiante))]
        public async Task<IHttpActionResult> PostEstudiante(Estudiante estudiante)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Estudiante.Add(estudiante);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = estudiante.IdLector }, estudiante);
        }

        // DELETE: api/Students/5
        [ResponseType(typeof(Estudiante))]
        public async Task<IHttpActionResult> DeleteEstudiante(int id)
        {
            Estudiante estudiante = await db.Estudiante.FindAsync(id);
            if (estudiante == null)
            {
                return NotFound();
            }

            db.Estudiante.Remove(estudiante);
            await db.SaveChangesAsync();

            return Ok(estudiante);
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