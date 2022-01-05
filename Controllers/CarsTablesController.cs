using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Practica1.Models;

namespace Practica1.Controllers
{
    public class CarsTablesController : Controller
    {
        private PractEntities db = new PractEntities();

        // GET: CarsTables
        public ActionResult Index()
        {
            return View(db.CarsTable.ToList());
        }

        // GET: CarsTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CarsTable carsTable = db.CarsTable.Find(id);
            if (carsTable == null)
            {
                return HttpNotFound();
            }
            return View(carsTable);
        }

        // GET: CarsTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CarsTables/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,carId,make,model,available")] CarsTable carsTable)
        {
            if (ModelState.IsValid)
            {
                db.CarsTable.Add(carsTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(carsTable);
        }

        // GET: CarsTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CarsTable carsTable = db.CarsTable.Find(id);
            if (carsTable == null)
            {
                return HttpNotFound();
            }
            return View(carsTable);
        }

        // POST: CarsTables/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,carId,make,model,available")] CarsTable carsTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(carsTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(carsTable);
        }

        // GET: CarsTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CarsTable carsTable = db.CarsTable.Find(id);
            if (carsTable == null)
            {
                return HttpNotFound();
            }
            return View(carsTable);
        }

        // POST: CarsTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CarsTable carsTable = db.CarsTable.Find(id);
            db.CarsTable.Remove(carsTable);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
