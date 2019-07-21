using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YeniKendoUI.Models;

namespace YeniKendoUI.Controllers
{
    public class AcilIsController : Controller
    {
        readonly KendoEntities kendoEntities = new KendoEntities();

        public ActionResult Index()
        {
            ViewData["defaultMenu"] = kendoEntities.Menus.Select(m => new MenuViewModel { MenuId = m.MenuID, Link = m.Link, Title = m.Title, Parent = new ParentViewModel { ParentId = m.Parent.ParentID, ParentName = m.Parent.ParentName } }).First();
            return View();
        }

        public JsonResult Get([DataSourceRequest]DataSourceRequest request)
        {
            var acilisler = kendoEntities.AcilIslers.Select(a => new AcilIslerViewModel
            {
                AcilIsId = a.AcilIsID,
                BildirimTarihi = a.BildirimTarihi,
                CozumTarihi = a.CozumTarihi,
                IsinAdi = a.IsinAdi,
                IsinSahibi = a.IsinSahibi,
                Menu = new MenuViewModel
                {
                    MenuId = a.Menu.MenuID,
                    Link = a.Menu.Link,
                    Title = a.Menu.Title,
                    Parent = new ParentViewModel
                    {
                        ParentId = a.Menu.Parent.ParentID,
                        ParentName = a.Menu.Parent.ParentName
                    }
                }
            });
            return this.Json(acilisler.ToDataSourceResult(request));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult Update([DataSourceRequest]DataSourceRequest request, AcilIslerViewModel acilIsler)
        {
            if (acilIsler != null && ModelState.IsValid)
            {
                var acilIsToUpdate = kendoEntities.AcilIslers.Where(a => a.AcilIsID == acilIsler.AcilIsId).FirstOrDefault();
                acilIsToUpdate.IsinAdi = acilIsler.IsinAdi;
                acilIsToUpdate.IsinSahibi = acilIsler.IsinSahibi;
                acilIsToUpdate.BildirimTarihi = acilIsler.BildirimTarihi;
                acilIsToUpdate.CozumTarihi = acilIsler.CozumTarihi;
                acilIsToUpdate.MenuId = acilIsler.Menu.MenuId;
                acilIsToUpdate.AcilIsID = acilIsler.AcilIsId;
            }
            else
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors);
            }
            kendoEntities.SaveChanges();

            return Json(ModelState.IsValid ? true : ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult Create([DataSourceRequest]DataSourceRequest request, AcilIslerViewModel acilIsler)
        {
            if (acilIsler != null && ModelState.IsValid)
            {
                var acilIsToCreate = new AcilIsler
                {
                    AcilIsID = acilIsler.AcilIsId,
                    BildirimTarihi = acilIsler.BildirimTarihi,
                    CozumTarihi = acilIsler.CozumTarihi,
                    IsinAdi = acilIsler.IsinAdi,
                    IsinSahibi = acilIsler.IsinSahibi,
                    MenuId = acilIsler.Menu.MenuId
                };

                kendoEntities.AcilIslers.Add(acilIsToCreate);
                kendoEntities.SaveChanges();
            }
            return Json(ModelState.IsValid ? true : ModelState.ToDataSourceResult());
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult Delete([DataSourceRequest]DataSourceRequest request, AcilIslerViewModel acilIsler)
        {
            if (acilIsler != null && ModelState.IsValid)
            {
                var acilIsToDelete = kendoEntities.AcilIslers.Where(a => a.AcilIsID == acilIsler.AcilIsId).FirstOrDefault();
                kendoEntities.AcilIslers.Remove(acilIsToDelete);
                kendoEntities.SaveChanges();
            }
            return Json(ModelState.IsValid ? true : ModelState.ToDataSourceResult());
        }
    }
}