using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YeniKendoUI.Models
{
    public class MenuViewModel
    {
        public int MenuId { get; set; }
        public string Link { get; set; }
        public string Title { get; set; }

        public ParentViewModel Parent { get; set; }
    }
}