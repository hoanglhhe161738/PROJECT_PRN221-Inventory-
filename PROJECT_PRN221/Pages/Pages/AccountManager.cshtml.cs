using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PROJECT_PRN221.Models;

namespace PROJECT_PRN221.Pages.Pages
{
    public class AccountManagerModel : PageModel
    {
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();

        public List<Account> users = new List<Account>();

        public void OnGet()
        {
            users = _dbcontext.Accounts.Include(u => u.RIdNavigation).ToList();
        }

        public void OnPost(string aid, string role)
        {
            users = _dbcontext.Accounts.Include(u => u.RIdNavigation).ToList();
            Account acc = _dbcontext.Accounts.Where(a => a.AId == int.Parse(aid)).FirstOrDefault();
            if(role == "Admin")
            {
                acc.RId = 1;
                _dbcontext.Accounts.Update(acc);
                _dbcontext.SaveChanges();
            }
            if (role == "Employee")
            {
                acc.RId = 2;
                _dbcontext.Accounts.Update(acc);
                _dbcontext.SaveChanges();
            }

        }
    }
}
