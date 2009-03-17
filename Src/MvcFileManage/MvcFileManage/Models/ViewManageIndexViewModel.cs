using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcFileManage.Models {
    public class ViewManageIndexViewModel : ViewManageViewModelBase {
        public List<string> Dict { get; set; }
        public List<string> Files { get; set; }
       
    }
}
