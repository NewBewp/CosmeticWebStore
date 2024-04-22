using System.Collections.Generic;
using WebBanMyPhan.Models;


namespace WebBanMyPhan.ModelViews
{
    public class ProductHomeVM
    {
        public Category category { get; set; }
        public List<Product> lsProducts { get; set; }
    }
}
