#pragma checksum "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "4e0e218d7d6b9a299ab7b9f9060e9170b33e405d8755444e2f950e1e02423c9e"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home__ListProductPartialView), @"mvc.1.0.view", @"/Views/Home/_ListProductPartialView.cshtml")]
namespace AspNetCore
{
    #line hidden
    using global::System;
    using global::System.Collections.Generic;
    using global::System.Linq;
    using global::System.Threading.Tasks;
    using global::Microsoft.AspNetCore.Mvc;
    using global::Microsoft.AspNetCore.Mvc.Rendering;
    using global::Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\_ViewImports.cshtml"
using WebBanMyPhan;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\_ViewImports.cshtml"
using WebBanMyPhan.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"4e0e218d7d6b9a299ab7b9f9060e9170b33e405d8755444e2f950e1e02423c9e", @"/Views/Home/_ListProductPartialView.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"f8a37c9af27d26b46f7927c2fdd03ff33c033f98356aa1e1c6d2e4f573723c06", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Home__ListProductPartialView : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Product>>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("img-full"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
 if (Model != null && Model.Count > 0)
{

#line default
#line hidden
#nullable disable
            WriteLiteral("    <div class=\"product-item-wrap row\">\r\n");
#nullable restore
#line 5 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
         foreach (var item in Model)
        {
            string url = $"/{item.Alias}-{item.ProductId}.html";

#line default
#line hidden
#nullable disable
            WriteLiteral("            <div class=\"col-xl-3 col-lg-4 col-sm-6\">\r\n                <div class=\"product-item\">\r\n                    <div class=\"product-img img-zoom-effect\">\r\n                        <a");
            BeginWriteAttribute("href", " href=\"", 408, "\"", 419, 1);
#nullable restore
#line 11 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
WriteAttributeValue("", 415, url, 415, 4, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "4e0e218d7d6b9a299ab7b9f9060e9170b33e405d8755444e2f950e1e02423c9e5007", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "src", 2, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            AddHtmlAttributeValue("", 478, "~/images/products/", 478, 18, true);
#nullable restore
#line 12 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
AddHtmlAttributeValue("", 496, item.Thumb, 496, 11, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            BeginAddHtmlAttributeValues(__tagHelperExecutionContext, "alt", 1, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
#nullable restore
#line 12 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
AddHtmlAttributeValue("", 514, item.Title, 514, 11, false);

#line default
#line hidden
#nullable disable
            EndAddHtmlAttributeValues(__tagHelperExecutionContext);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
                        </a>
                        <div class=""product-add-action"">
                            <ul>
                                <li>
                                    <a href=""cart.html"">
                                        <i class=""pe-7s-cart""></i>
                                    </a>
                                </li>                                
                            </ul>
                        </div>
                    </div>
                    <div class=""product-content"">
                        <a class=""product-name""");
            BeginWriteAttribute("href", " href=\"", 1121, "\"", 1132, 1);
#nullable restore
#line 25 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
WriteAttributeValue("", 1128, url, 1128, 4, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 25 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
                                                       Write(item.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a>\r\n                        <div class=\"price-box pb-1\">\r\n                            <span class=\"new-price\">");
#nullable restore
#line 27 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
                                               Write(item.Price.Value.ToString("#,##0"));

#line default
#line hidden
#nullable disable
            WriteLiteral(" VND </span>\r\n                        </div>                        \r\n                    </div>\r\n                </div>\r\n            </div>\r\n");
#nullable restore
#line 32 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </div>\r\n");
#nullable restore
#line 34 "E:\Kien\do_an_chuyen_nganh_github\WebBanMyPhan\WebBanMyPhan\WebBanMyPhan\Views\Home\_ListProductPartialView.cshtml"
}

#line default
#line hidden
#nullable disable
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Product>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591