
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PROJECT_PRN221.Models;

namespace PROJECT_PRN221.Pages.Pages
{
    public class ReportSalesModel : PageModel
    {
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();
        public List<BillOutput> billOutputs = new List<BillOutput>();
        public string massage { get; set; }
        public Product product { get; set; }

        public void OnGet(string ProductId, string Quantity)
        {
            product = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).Where(p => p.ProductId == int.Parse(ProductId)).FirstOrDefault();
            billOutputs  = _dbcontext.BillOutputs.Include(b=> b.Product).ToList();
        }
        public void OnPost(string ProductId, string Quantity)
        {
            product = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).Where(p => p.ProductId == int.Parse(ProductId)).FirstOrDefault();
            BillOutput billOutput = new BillOutput();
            billOutput.DateSell = DateTime.Now;
            billOutput.ProductId = int.Parse(ProductId);
            billOutput.Amount = int.Parse(Quantity);

            product.Quantity = product.Quantity - decimal.Parse(Quantity);
            _dbcontext.Products.Update(product);
            _dbcontext.BillOutputs.Add(billOutput);
            _dbcontext.SaveChanges();
            billOutputs = _dbcontext.BillOutputs.Include(b => b.Product).ToList();

        }

        //public void OnGet()
        //{

        //}
    }
}
