using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.Mvc;
using InventorySystem.Models;

namespace InventorySystem.Controllers
{
    public class categoriesController : Controller
    {
        private InventorySystemEntities2 db = new InventorySystemEntities2();

        // GET: categories
        public ActionResult Index()
        {
            return View(db.categories.ToList());
        }

        // GET: categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category category = db.categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: categories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cid,name,description")] category category)
        {
            if (ModelState.IsValid)
            {
                //catching unique value error
                bool IsCategoryNameExist = db.categories.Any
                (x => x.name == category.name);
                if (IsCategoryNameExist == true)
                {
                    ModelState.AddModelError("name", "Category Name already exists");
                }
                db.categories.Add(category);
                try
                {
                    db.SaveChanges();
                    TempData["Success"] = "Category Added Successfully";
                    return RedirectToAction("Index");
                }
                catch
                {
                    TempData["warning"] = "Category Cannot be Added Successfully,  Try Again";
                   // return RedirectToAction("Create");
                }
                
            }

            return View(category);
        }

        // GET: categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category category = db.categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: categories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cid,name,description")] category category)
        {
            if (ModelState.IsValid)
            {
                //catching unique value error
                bool IsCategoryNameExist = db.categories.Any
                (x => x.name == category.name);
                if (IsCategoryNameExist == true)
                {
                    ModelState.AddModelError("name", "Category Name already exists");
                }
                db.Entry(category).State = EntityState.Modified;
                try
                {
                  
                    db.SaveChanges();
                    TempData["Success"] = "Category Updated Successfully";
                    return RedirectToAction("Index");

                }
                catch
                {
                    TempData["warning"] = "Category Cannot be Updated,  Try Again";
                }
                
                
            }
            return View(category);
        }

        // GET: categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            category category = db.categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            category category = db.categories.Find(id);
            try
            {
                db.categories.Remove(category);
                db.SaveChanges();
                TempData["Success"] = "Category Deleted Successfully";
            
            }
            catch
            {
                TempData["warning"] = "Category cannot be Deleted!, its Details are used by other table(s)";
            }
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
