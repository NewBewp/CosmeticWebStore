using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using WebBanMyPhan.Extension;
using WebBanMyPhan.Models;
using WebBanMyPhan.ModelViews;

namespace WebBanMyPhan.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly soryami_MyPhamDBContext _context;
        public INotyfService _notyfService { get; }      

        public ShoppingCartController(soryami_MyPhamDBContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if(gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }


        [HttpPost]
        [Route("api/cart/add")]
        public IActionResult AddToCart(int productID, int? amount)
        {
            List<CartItem> gioHang = GioHang;
            try
            {
                //Thêm sản phẩm vào giỏ hàng
                CartItem item = GioHang.SingleOrDefault(p => p.product.ProductId == productID);
                if (item != null)//đã có --> cập nhật số lượng
                {
                    if (amount.HasValue)
                    {
                        item.amount = amount.Value;
                    }
                    else
                    {
                        item.amount++;
                    }
                }
                else
                {
                    Product hh = _context.Products.SingleOrDefault(p => p.ProductId == productID);
                    item = new CartItem
                    {
                        amount = amount.HasValue ? amount.Value : 1,
                        product = hh
                    };
                    gioHang.Add(item);//thêm vào giỏ hàng
                }
                //lưu lại vào session
                
                HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
                _notyfService.Success("Thêm sản phẩm thành công");
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }           
        }

        [HttpPost]
        [Route("api/cart/update")]
        public IActionResult UpdateCart(int productID, int? amount)
        {
            //lấy giỏ hàng để xử lý
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            try
            {
                if(cart != null)
                {
                    CartItem item = cart.SingleOrDefault(p=>p.product.ProductId == productID);
                    if(item != null && amount.HasValue)//đã có --> cật nhật số lượng
                    {
                        item.amount=amount.Value;
                    }
                    //lưu lại session
                    HttpContext.Session.Set<List<CartItem>>("GioHang",cart);
                }
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }
        }

        [HttpPost]
        [Route("api/cart/remove")]
        public IActionResult Remove(int productID)
        {
            try
            {
                List<CartItem> gioHang = GioHang;
                CartItem item = gioHang.SingleOrDefault(p => p.product.ProductId == productID);
                if (item != null)
                {
                    gioHang.Remove(item);
                }
                //lưu lại session
                HttpContext.Session.Set<List<CartItem>>("GioHang", gioHang);
                return Json(new { success = true });
            }
            catch
            {
                return Json(new { success = false });
            }          
        }

        [Route("cart.html", Name ="Cart")]
        public IActionResult Index()
        {
            return View(GioHang);
        }
    }
}
    