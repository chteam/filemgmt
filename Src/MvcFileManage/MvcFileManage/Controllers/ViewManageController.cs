using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.IO;
using MvcFileManage.Models;
namespace MvcFileManage.Controllers {
    public class ViewManageController : Controller {
        #region Browse the Dictionary

        /// <summary>
        /// browse the dictionary
        /// </summary>
        /// <param name="fn"></param>
        /// <returns></returns>
        public ActionResult Index(string fn) {
            if (string.IsNullOrEmpty(fn)) fn = "\\";
            if (fn.Contains("..")) throw new HttpException(404, "目录不存在");
            var serverfn = Server.MapPath(fn);
            var subs = Directory.GetFileSystemEntries(serverfn);
            var dict = new List<string>();
            var files = new List<string>();
            foreach (var obj in subs) {
                if (Directory.Exists(obj))
                    dict.Add(obj);
                //  CopyDir(file, destPath + Path.GetFileName(file));
                // 否则直接Copy文件
                else
                    files.Add(obj);
                //File.Copy(file, destPath + Path.GetFileName(file), true);
            }
            var m = new ViewManageIndexViewModel {
                Dict = dict,
                Files = files,
                Path = fn
            };
            return View(m);
        }

        #endregion

        #region Create Dictionary
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CreateDictionary(string fn) {
            var m = new ViewManageViewModelBase { Path = fn };
            return View(m);
        }
        /// <summary>
        /// Create Dictionary
        /// </summary>
        /// <param name="fn"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateDictionary(string fn, string name) {
            if (string.IsNullOrEmpty(name.Trim())) return View();
            var serverfn = Server.MapPath(fn);
            if (Directory.Exists(Path.Combine(serverfn, name))) return View();
            Directory.CreateDirectory(Path.Combine(serverfn, name));

            return RedirectToAction("Index", new { fn });
        }

        #endregion

        #region Rename Dictionary
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult RenameDictionary(string fn) {
            var m = new ViewManageViewModelBase { Path = fn };
            return View(m);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult RenameDictionary(string fn, string name) {
            if (string.IsNullOrEmpty(name.Trim())) return View();
            var serverfn = Server.MapPath(fn);
            var newpath = Path.Combine(Path.GetDirectoryName(serverfn), name);
            if (Path.GetFileName(fn) == name) return View();
            if (!Directory.Exists(serverfn)) return View();
            if (Directory.Exists(newpath)) return View();
            Directory.Move(serverfn, newpath);
            return RedirectToAction("Index", new { fn = Path.GetDirectoryName(fn) });
        }
        #endregion

        #region Delete Dictionary
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult DeleteDictionary(string fn) {
            var m = new ViewManageViewModelBase { Path = fn };
            return View(m);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        [ActionName("DeleteDictionary")]
        public ActionResult DeleteDictionary2(string fn) {
           
            var serverfn = Server.MapPath(fn);
            if (!Directory.Exists(serverfn)) return View();
            var path = new DirectoryInfo(serverfn);
            RecursionDelete(path);
            return RedirectToAction("Index", new { fn = Path.GetDirectoryName(fn) });
        }
        private void RecursionDelete(DirectoryInfo path) {
            foreach (DirectoryInfo d in path.GetDirectories()) {
                RecursionDelete(d);
            }
            foreach (FileInfo f in path.GetFiles()) {
                f.Delete();
            }
            path.Delete();
        }  
        #endregion
    }
}
