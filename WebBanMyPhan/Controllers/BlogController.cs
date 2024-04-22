using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Threading.Tasks;
using WebBanMyPhan.Models;

namespace WebBanMyPhan.Controllers
{
    public class BlogController : Controller
    {
        private readonly soryami_MyPhamDBContext _context;

        public BlogController(soryami_MyPhamDBContext context)
        {
            _context = context;
        }


        //public IActionResult Index(int? page)
        //{
        //    var pageNumber = page == null || page <= 0 ? 1 : page.Value;
        //    var pageSize = 10;
        //    var 

        //    return View();
        //}
    }
}
