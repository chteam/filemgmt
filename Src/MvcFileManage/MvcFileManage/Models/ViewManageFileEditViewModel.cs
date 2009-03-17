using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace MvcFileManage.Models {
    public class ViewManageFileEditViewModel : ViewManageViewModelBase {
        public string Filename { get; set; }
        public Encoding Encoding { get; set; }
        public bool IsEdit { get; set; }
        public string Content { get; set; }
    }
}
