using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace YeniKendoUI.Models
{
    public class AcilIslerViewModel
    {
        public int AcilIsId { get; set; }
        public string IsinAdi { get; set; }

        //[UIHint("DateTime")]
        
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime? BildirimTarihi { get; set; }

        
        [DataType(DataType.DateTime)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime? CozumTarihi { get; set; }

        public string IsinSahibi { get; set; }

        [UIHint("MenuEditor")]
        public MenuViewModel Menu { get; set; }
    }
}