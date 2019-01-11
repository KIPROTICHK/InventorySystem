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
    public class productDetailsController : Controller
    {
        private InventorySystemEntities2 db = new InventorySystemEntities2();

        // GET: productDetails
        public async Task<ActionResult> Index()
        {
            var productDetails = db.productDetails.Include(p => p.product);
            return View(await productDetails.ToListAsync());
        }

        // GET: productDetails/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            productDetail productDetail = await db.productDetails.FindAsync(id);
            if (productDetail == null)
            {
                return HttpNotFound();
            }
            return View(productDetail);
        }

        // GET: productDetails/Create
        public ActionResult Create()
        {
            ViewBag.productID = new SelectList(db.products, "pid", "name");
            return View();
        }

        // POST: productDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "pdid,productID,name,description,bprice,sprice,discountAllowed,discountReceived,date")] productDetail productDetail)
        {
            if (ModelState.IsValid)
            {
                db.productDetails.Add(productDetail);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.productID = new SelectList(db.products, "pid", "name", productDetail.productID);
            return View(productDetail);
        }

        // GET: productDetails/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            productDetail productDetail = await db.productDetails.FindAsync(id);
            if (productDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.productID = new SelectList(db.products, "pid", "name", productDetail.productID);
            return View(productDetail);
        }

        // POST: productDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "pdid,productID,name,description,bprice,sprice,discountAllowed,discountReceived,date")] productDetail productDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productDetail).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.productID = new SelectList(db.products, "pid", "name", productDetail.productID);
            return View(productDetail);
        }

        // GET: productDetails/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            productDetail productDetail = await db.productDetails.FindAsync(id);
            if (productDetail == null)
            {
                return HttpNotFound();
            }
            return View(productDetail);
        }

        // POST: productDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            productDetail productDetail = await db.productDetails.FindAsync(id);
            db.productDetails.Remove(productDetail);
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
