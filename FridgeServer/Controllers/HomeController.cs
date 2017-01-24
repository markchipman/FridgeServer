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

        public ActionResult GetProducts() {
            List<Product> p = dbc.Products.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        public ActionResult GetReceipes() {
            List<Receipt> p = dbc.Receipts.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }

        public ActionResult GetFridges() {
            List<Fridge> p = dbc.Fridges.ToList();
            return Content(JsonConvert.SerializeObject(p));
        }
    }
}