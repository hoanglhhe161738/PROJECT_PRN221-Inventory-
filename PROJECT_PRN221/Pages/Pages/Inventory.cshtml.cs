using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PROJECT_PRN211.Models;

namespace PROJECT_PRN211.Pages.Pages
{
    public class InventoryModel : PageModel
    {
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();

        public List<BillImport> billImports = new List<BillImport>();
        public void OnGet()
        {
            billImports = _dbcontext.BillImports.Include(b => b.Supplier).Include(b => b.Category).ToList();
        }
    }
}
