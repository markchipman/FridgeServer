using FridgeServer.Database;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FridgeServer.Controllers {
    public class HomeController : Controller {
        private DBContainer dbc = new DBContainer();
        public ActionResult Index() {
            return View();
        }

        public ActionResult About() {
            ViewBag.Message = "About";

            return View();
        }

        public ActionResult Contact() {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult InitializeDB() {
            return Content(StaticFiller.Fill(dbc));
        }

        public ActionResult GetMarkets() {
            List<Market> p = dbc.Markets.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        [HttpPost]
        public ActionResult AddMarket(Market m) {
            if (m != null) {
                foreach (Product p in m.Products)
                    dbc.Products.Add(p);
                dbc.Markets.Add(m);
                dbc.SaveChanges();
                return Content("Success");
            } else {
                return Content("Failed");
            }
        }

        public ActionResult AddProductToMarket(int MarketID, int ProductID) {
            Market m = dbc.Markets.Find(MarketID);
            Product p = dbc.Products.Find(ProductID);
            m.Products.Add(p);
            return Content("Success");
        }

        public ActionResult GetProducts() {
            List<Product> p = dbc.Products.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        [HttpPost]
        public ActionResult AddProduct(Product p) {
            if (p != null) {
                dbc.Products.Add(p);
                return Content("Success");
            } else {
                return Content("Failed");
            }
        }

        public ActionResult GetReceipes() {
            List<Receipt> p = dbc.Receipts.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        [HttpPost]
        public ActionResult AddReceipt(Receipt r) {
            if (r != null) {
                foreach (Product p in r.Products)
                    dbc.Products.Add(p);
                dbc.Receipts.Add(r);
                dbc.SaveChanges();
                return Content("Success");
            } else {
                return Content("Failed");
            }
        }

        public ActionResult AddProductToReceipt(int ReceiptID, int ProductID) {
            Receipt m = dbc.Receipts.Find(ReceiptID);
            Product p = dbc.Products.Find(ProductID);
            m.Products.Add(p);
            return Content("Success");
        }

        public ActionResult GetFridges() {
            List<Fridge> p = dbc.Fridges.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        [HttpPost]
        public ActionResult AddFridge(Fridge f) {
            if (f != null) {
                dbc.Locations.Add(f.Location);
                dbc.Fridges.Add(f);
                dbc.SaveChanges();
                return Content("Success");
            } else {
                return Content("Failed");
            }
        }

        public ActionResult AddProductToFridge(int FridgeID, int ProductID) {
            Fridge m = dbc.Fridges.Find(FridgeID);
            Product p = dbc.Products.Find(ProductID);
            m.Products.Add(p);
            return Content("Success");
        }
    }
}