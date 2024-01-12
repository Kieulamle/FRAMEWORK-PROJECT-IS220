using Model.Dao;
using Model.EF;
using doan.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace doan.Controllers
{
    public class LayoutClientController : Controller
    {
        // GET: LayoutClient
        private doanDbContext db = new doanDbContext();
        private NguoiDungDao nddao = new NguoiDungDao();
        public ActionResult GetData()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            return View();
        }
    }
}