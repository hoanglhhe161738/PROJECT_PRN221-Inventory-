﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using PROJECT_PRN221.Models;
using System.Text;

namespace PROJECT_PRN221.Pages.Pages
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

        public void OnPost(string categoryName)
        {
            SelectedCategory = categoryName;
            categories = _dbcontext.CategoryIds.Include(c => c.Products).ToList();
            products = _dbcontext.Products.Include(p => p.Category).Include(p => p.Supplier).Where(p => p.Category.CategoryName == categoryName).OrderByDescending(p => p.DateExpiration).ToList();

        }
    }
    }
