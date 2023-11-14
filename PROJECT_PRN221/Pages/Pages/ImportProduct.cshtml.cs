using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PROJECT_PRN221.Models;

namespace PROJECT_PRN221.Pages.Pages
{
    public class ImportProductModel : PageModel
    {
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();

        public List<CategoryId> categoryIds = new List<CategoryId>();
        public List<Supplier> suppliers = new List<Supplier>();
        public List<Product> products = new List<Product>();

        public int SelectedProduct { get; set; }

        public int SelectedCategory { get; set; }
        public int SelectedSupplier { get; set; }
        public void OnGet()
        {
            categoryIds = _dbcontext.CategoryIds.ToList();
            suppliers = _dbcontext.Suppliers.ToList();
        }

        public void OnPost(string CateoryID, string SupplierID) {
            SelectedCategory = int.Parse(CateoryID);
            SelectedSupplier = int.Parse(SupplierID);
            categoryIds = _dbcontext.CategoryIds.ToList();
            suppliers = _dbcontext.Suppliers.ToList();
            products = _dbcontext.Products.Where(p => p.SupplierId == int.Parse(SupplierID) && p.CategoryId == int.Parse(CateoryID)).ToList();
            
        }

        public void OnPostAdd(string ProductID, string amount)
        {
            SelectedProduct = int.Parse(ProductID);
            categoryIds = _dbcontext.CategoryIds.ToList();
            suppliers = _dbcontext.Suppliers.ToList();
            products = _dbcontext.Products.ToList();

            Product p = _dbcontext.Products.Where(p => p.ProductId == int.Parse(ProductID)).FirstOrDefault();
            p.Quantity = p.Quantity + int.Parse(amount);
            _dbcontext.Products.Update(p);
            _dbcontext.SaveChanges();

        }
    }
}
