using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using WebBanMyPhan.ModelViews;
using Microsoft.AspNetCore.Http;
using WebBanMyPhan.Extension;

namespace WebBanMyPhan.Controllers.Components
{
    public class HeaderCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");

            return View(cart);
        }
    }
}
