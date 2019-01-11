using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using InventorySystem.Models;

namespace InventorySystem.Controllers
{
    public class subCategoriesController : Controller
    {
        private InventorySystemEntities2 db = new InventorySystemEntities2();

        // GET: subCategories
        public async Task<ActionResult> Index()
        {
            var subCategories = db.subCategories.Include(s => s.category);
            return View(await subCategories.ToListAsync());
        }

        // GET: subCategories/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            subCategory subCategory = await db.subCategories.FindAsync(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // GET: subCategories/Create
        public ActionResult Create()
        {
            var theTypelist = (from tl in db.categories
                               orderby (tl.name)
                               select new
                               {
                                   tl.cid,
                                   tl.name
                               });
            ViewBag.categoryID = new SelectList(theTypelist, "cid", "name");
            return View();
        }

        // POST: subCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "categoryID,scid,name,description")] subCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                db.subCategories.Add(subCategory);
                await db.SaveChangesAsync();

                return RedirectToAction("Index");
            }

            ViewBag.categoryID = new SelectList(db.categories, "cid", "name", subCategory.categoryID);
            return View(subCategory);
        }

        // GET: subCategories/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            subCategory subCategory = await db.subCategories.FindAsync(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryID = new SelectList(db.categories, "cid", "name", subCategory.categoryID);
            return View(subCategory);
        }

        // POST: subCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "categoryID,scid,name,description")] subCategory subCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subCategory).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.categoryID = new SelectList(db.categories, "cid", "name", subCategory.categoryID);
            return View(subCategory);
        }

        // GET: subCategories/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            subCategory subCategory = await db.subCategories.FindAsync(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // POST: subCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            subCategory subCategory = await db.subCategories.FindAsync(id);
            db.subCategories.Remove(subCategory);
            await db.SaveChangesAsync();
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
