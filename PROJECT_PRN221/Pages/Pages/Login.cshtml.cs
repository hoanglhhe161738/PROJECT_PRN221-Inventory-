using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PROJECT_PRN211.Models;
using Microsoft.AspNetCore.Http;


namespace PROJECT_PRN211.Pages.Pages
{
    public class LoginModel : PageModel
    {

        private Grocery_DatabaseContext _dbcontext = new Grocery_DatabaseContext();

        public string? message { get; set; }



        public void OnGet()
        {
        }

        public IActionResult OnPost(string username, string password)
        {

            if (username == null || password == null)
            {
                message = "Bạn phải nhập đầy đủ các trường";
                return this.Page();
            }


            Account? account = _dbcontext.Accounts.Where(a => a.Username == username).FirstOrDefault();
            if (account == null)
            {
                message = " tài khoản không tồn tại";
            }
            else
            {
                if (password == account.Password)
                {
                    if(account.RId == null)
                    {
                        message = "Bạn chưa được phép đăng nhập vào hệ thống";
                        return this.Page();
                    }

                    ISession session = HttpContext.Session;
                    session.SetString("role_id", account.RId.ToString());
                    message = "Đăng nhập thành công";
                    return RedirectToPage("HomeView");

                }
                else
                {
                    message = "sai tên tài khoản hoặc mật khẩu";
                    return this.Page();
                }
            }
            return this.Page();


        }

    }
}
