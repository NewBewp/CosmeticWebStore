using Microsoft.AspNetCore.Mvc;
using WebBanMyPhan.Models;
using WebBanMyPhan.Helpper;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace WebBanMyPhan.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SearchController : Controller
    {
        private readonly soryami_MyPhamDBContext _context;

        public SearchController(soryami_MyPhamDBContext context)
        {
            _context = context;
        }

        //Get: search/FindProduct
        [HttpPost]
        public IActionResult FindProduct(string keyword)
        {
            List<Product> ls = new List<Product>();
            if(string.IsNullOrEmpty(keyword) || keyword.Length < 1)
            {
                return PartialView("ListProductsSearchPartial", null);
            }
            ls = _context.Products
                                    .AsNoTracking()
                                    .Include(a => a.Cat)
                                    .Where(x => x.ProductName.Contains(keyword))
                                    .OrderByDescending(x => x.ProductName)
                                    .Take(10)
                                    .ToList();
            if (ls==null)
            {
                return PartialView("ListProductsSearchPartial", null);
            }
            else
            {
                return PartialView("ListProductsSearchPartial", ls);
            }
        }
    }
}
