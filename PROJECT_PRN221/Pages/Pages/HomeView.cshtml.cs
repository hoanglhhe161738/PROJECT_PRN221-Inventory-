using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using PROJECT_PRN211.Models;
using System.Text;

namespace PROJECT_PRN211.Pages.Pages
{

    public class HomeViewModel : PageModel
    {
        private Role role { get; set; }
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();

        public string message { get; set; }

        public List<Product> products { get; set; }

        public List<CategoryId> categories { get; set; }
        public string SelectedCategory { get; set; }



        public void OnGet()
        {
            getdata();
            message = "Product Managenent";
            return;
        }


        public void getdata()
        {
            categories = _dbcontext.CategoryIds.Include(c => c.Products).ToList();
            products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.DateExpiration).ToList();
        }
        public IActionResult OnGetCheckAuth()
        {
            getdata();
            ISession session = HttpContext.Session;
            var role_id_raw = session.Get("role_id");
            string role_id = Encoding.UTF8.GetString(role_id_raw);
            List<Role> roles = _dbcontext.Roles.Include(r => r.Features).Where(r => r.RId == int.Parse(role_id)).ToList();
            foreach (Role role in roles)
            {
                List<Feature> features = new List<Feature>();
                features = role.Features.ToList();
                foreach (Feature feature in features)
                {
                    if (feature.FeatureId == 1)
                    {
                        return RedirectToPage("Inventory");
                    }
                    else
                    {
                        message = "Bạn không được quyền vào trang này";
                        return this.Page();
                    }
                }
            }
            return this.Page();
        }
        [HttpGet]
        public IActionResult OnPostSortBy(string value)
        {
            categories = _dbcontext.CategoryIds.Include(c => c.Products).ToList();
            if (value == "name_des")
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.ProductName).ToList();
            }else if(value == "name_incre"){
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).ToList();

            }else if(value == "price_h_L")
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.Price).ToList();
            }
            else
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.DateExpiration).ToList();
            }
            return this.Page();
        }
        public IActionResult OnPostDelete(int productId)
        {
            var bill_output = _dbcontext.BillOutputs.Where(b => b.ProductId == productId).ToArray();
            _dbcontext.BillOutputs.RemoveRange(bill_output);
            var pro = _dbcontext.Products.Where(p=> p.ProductId == productId).FirstOrDefault();
            if (pro != null)
            {
                _dbcontext.Products.Remove(pro);
                _dbcontext.SaveChanges();
                getdata();
                return this.Page();
            }
            else
            {
                return NotFound();
            }
        }
        public IActionResult OnGetCheckAuth2()
        {
            getdata();

            ISession session = HttpContext.Session;
            var role_id_raw = session.Get("role_id");
            string role_id = Encoding.UTF8.GetString(role_id_raw);
            List<Role> roles = _dbcontext.Roles.Include(r => r.Features).Where(r => r.RId == int.Parse(role_id)).ToList();
            foreach (Role role in roles)
            {
                List<Feature> features = new List<Feature>();
                features = role.Features.ToList();
                foreach (Feature feature in features)
                {
                    if (feature.FeatureId == 2)
                    {
                        return RedirectToPage("AccountManager");
                        
                    }
                    else
                    {
                        message = "Bạn không được quyền vào trang này";

                    }
                }
            }
            return this.Page();
        }

        public IActionResult OnPostFilter(string categoryName)
        {
            SelectedCategory = categoryName;
            categories = _dbcontext.CategoryIds.Include(c => c.Products).ToList();

            if (categoryName == "ALL")
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.DateExpiration).ToList();
            }
            else
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).Where(p => p.Category.CategoryName == categoryName ).OrderByDescending(p => p.DateExpiration).ToList();
            }

            return this.Page();
        }
        public IActionResult OnPostSearchByName(string ProductName)
        {
            categories = _dbcontext.CategoryIds.Include(c => c.Products).ToList();
            
            if (ProductName == string.Empty)
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).OrderByDescending(p => p.DateExpiration).ToList();
            }
            else
            {
                products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).Where(p => p.ProductName == ProductName).OrderByDescending(p => p.DateExpiration).ToList();
            }
            if(products == null)
            {
                return NotFound() ;
            }
            return this.Page();
        }
    }
    }
