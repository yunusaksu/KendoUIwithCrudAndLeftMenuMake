using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YeniKendoUI.Models;

namespace YeniKendoUI.Controllers
{
    public class MenuController : Controller
    {
        readonly KendoEntities entities = new KendoEntities();

        public JsonResult Index()
        {
            var menuler = entities.Menus.Select(m => new MenuViewModel
            {
                Link = m.Link,
                MenuId = m.MenuID,
                Title = m.Title,
                Parent = new ParentViewModel
                {
                    ParentId = m.Parent.ParentID,
                    ParentName = m.Parent.ParentName
                }
            });

            return this.Json(menuler, JsonRequestBehavior.AllowGet);
        }
    }
}