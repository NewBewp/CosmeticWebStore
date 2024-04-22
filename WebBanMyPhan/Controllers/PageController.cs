using Microsoft.AspNetCore.Mvc;
using WebBanMyPhan.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace WebBanMyPhan.Controllers
{
    public class PageController : Controller
    {
        private readonly soryami_MyPhamDBContext _context;

        public PageController(soryami_MyPhamDBContext context)
        {
            _context = context;
        }
        //GET: Pages/Detail/5
        [Route("/page/{Alias}", Name = "PageDetails")]
        public IActionResult Details(string Alias) 
        {
            if(string.IsNullOrEmpty(Alias)) return RedirectToAction("Index","Home");
            var page = _context.Pages.AsNoTracking().SingleOrDefault(x => x.Alias == Alias);
            if(page == null)
            {
                return RedirectToAction("Index","Home");
            }
            return View(page);  

        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
