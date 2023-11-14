using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PROJECT_PRN221.Models;

namespace PROJECT_PRN221.Pages.Pages
{
    public class RegisterModel : PageModel
    {
        public string? message { get; set; }
        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();
        public void OnGet()
        {
        }
        public void OnPost(string username, string password, string re_password)
        {
            if ((username == null) || (password == null) || (re_password == null))
            {
                message = "Bạn phải nhập đầy đủ các trường";
                return;
            }

            if (password != re_password)
            {
                message = "Password và re_password không khớp yêu cầu nhập lại";
                return;
            }
            List<Account> accounts = new List<Account>();
            accounts = _dbcontext.Accounts.ToList();
            foreach (var item in accounts)
            {
                if (item.Username == username)
                {
                    message = "Tên tài khoản đã tồn tại vui lòng nhập tên tài khoản khác";
                    return;
                }
            }

            Account account = new Account();
            account.Username = username;
            account.Password = password;
            _dbcontext.Accounts.Add(account);
            _dbcontext.SaveChanges();
            message = "Đăng ký thành công";
            Redirect("/Pages/Login");
            return;
        }
    }
}
