using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WebBanMyPhan.Extension;
using WebBanMyPhan.Models;
using WebBanMyPhan.ModelViews;

namespace WebBanMyPhan.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly soryami_MyPhamDBContext _context;
        public INotyfService _notyfService { get; }

        public CheckoutController(soryami_MyPhamDBContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if( gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }


        public IActionResult Index()
        {
            return View();
        }
    }
}
