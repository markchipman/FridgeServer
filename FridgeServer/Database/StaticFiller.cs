using FridgeServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FridgeServer.Database {
    public static class StaticFiller {

        public static string Fill(DBContainer dbc) {
            /*FillMarketsAndLocations(dbc);
            FillProducts(dbc);
            FillReceipts(dbc);*/
            FillFridge(dbc);
            return "DONEEEEE";
        }

        public static void FillFridge(DBContainer dbc) {
            Fridge f = new Fridge();
            f.Name = "Fridge1";
            Location l = new Location();
            l.Latitude = 41.9713999;
            l.Longitude = 21.4183388;
            f.Location = l;
            l.Fridge = f;
            dbc.Locations.Add(l);
            dbc.Fridges.Add(f);

            dbc.SaveChanges();
        }

        public static void FillMarketsAndLocations(DBContainer dbc) {
            Market m = new Market();
            Location l = new Location();
            l.Latitude = 41.9713929;
            l.Longitude = 21.4183397;
            l.Market = m;
            m.Name = "СП";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 42.0026635;
            l.Longitude = 21.3740188;
            l.Market = m;
            m.Name = "Тинекс";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 41.993978;
            l.Longitude = 21.4325983;
            l.Market = m;
            m.Name = "Веро";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 41.9914047;
            l.Longitude = 21.425609;
            l.Market = m;
            m.Name = "Рамстор";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 41.993957;
            l.Longitude = 21.3996543;
            l.Market = m;
            m.Name = "КАМ";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 42.0068395;
            l.Longitude = 21.3979474;
            l.Market = m;
            m.Name = "Гранап";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();

            m = new Market();
            l = new Location();
            l.Latitude = 41.9801143;
            l.Longitude = 21.473186;
            l.Market = m;
            m.Name = "Рептил";
            dbc.Locations.Add(l);
            dbc.Markets.Add(m);

            dbc.SaveChanges();
        }

        public static void FillProducts(DBContainer dbc) {
            dbc.Products.Add(new Product("Кашкавал", 1.0, ""));
            dbc.Products.Add(new Product("Салама", 2.0, ""));
            dbc.Products.Add(new Product("Феферони", 0.0, ""));
            dbc.Products.Add(new Product("Павлака", 3.1, ""));
            dbc.Products.Add(new Product("Сирење", 1.0, ""));
            dbc.Products.Add(new Product("Кечап", 2.0, ""));
            dbc.Products.Add(new Product("Мајонез", 0.0, ""));
            dbc.Products.Add(new Product("Сланина", 3.1, ""));
            dbc.Products.Add(new Product("Свински врат", 1.0, ""));
            dbc.Products.Add(new Product("Печурки", 2.0, ""));
            dbc.Products.Add(new Product("Јогурт", 1.1, ""));
            dbc.Products.Add(new Product("Моцарела", 2.5, ""));
            dbc.Products.Add(new Product("Млеко", 1.0, ""));

            dbc.SaveChanges();
        }

        public static void FillReceipts(DBContainer dbc) {
            Receipt r = new Receipt();
            r.Name = "Палачинки";
            r.Products.Add(dbc.Products.Find(0));
            r.Description = "Изматете ги јајцата, додајте им сол, шеќер и млеко. Додајте брашно и матете додека не ги стопите грутките кои се прават во тестото.\n" +
                "\n" +
                "Ова главно зависи од брашното, но треба да добиете многу густа смеса за палачинки.\n" +
                "\n" +
                "Додајте ја киселата вода и промешајте.\n" +
                "\n" +
                "Оставете ја смесата да отстои 20-ина минути, а потоа печете ги палачинките на силен оган";

            dbc.Receipts.Add(r);
            dbc.SaveChanges();

        }
    }
}