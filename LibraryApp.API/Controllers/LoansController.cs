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

namespace LibraryApp.API.Controllers
{
    [RoutePrefix("api/loans")]
    public class LoansController : ApiController
    {
        private LibraryEntities db = new LibraryEntities();

        [HttpGet]
        public IQueryable<Prestamo> GetPrestamo()
        {
            return db.Prestamo;
        }

        [HttpGet]
        [Route("{id}")]
        [ResponseType(typeof(Prestamo))]
        public async Task<IHttpActionResult> GetPrestamo(int id)
        {
            Prestamo prestamo = await db.Prestamo.FindAsync(id);
            if (prestamo == null)
            {
                return NotFound();
            }

            return Ok(prestamo);
        }

        [HttpPut]
        [Route("{id}")]
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutPrestamo(int id, Prestamo prestamo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != prestamo.IdLector)
            {
                return BadRequest();
            }

            db.Entry(prestamo).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrestamoExists(id))
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
         
        [ResponseType(typeof(Prestamo))]
        public async Task<IHttpActionResult> PostPrestamo(Prestamo prestamo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Prestamo.Add(prestamo);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (PrestamoExists(prestamo.IdLector))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = prestamo.IdLector }, prestamo);
        }

        [HttpDelete]
        [Route("{id}")]
        [ResponseType(typeof(Prestamo))]
        public async Task<IHttpActionResult> DeletePrestamo(int id)
        {
            Prestamo prestamo = await db.Prestamo.FindAsync(id);
            if (prestamo == null)
            {
                return NotFound();
            }

            db.Prestamo.Remove(prestamo);
            await db.SaveChangesAsync();

            return Ok(prestamo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PrestamoExists(int id)
        {
            return db.Prestamo.Count(e => e.IdLector == id) > 0;
        }
    }
}