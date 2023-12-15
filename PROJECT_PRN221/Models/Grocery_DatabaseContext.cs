using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace PROJECT_PRN211.Models
{
    public partial class Grocery_DatabaseContext : DbContext
    {
        public Grocery_DatabaseContext()
        {
        }

        public Grocery_DatabaseContext(DbContextOptions<Grocery_DatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<BillImport> BillImports { get; set; } = null!;
        public virtual DbSet<BillOutput> BillOutputs { get; set; } = null!;
        public virtual DbSet<CategoryId> CategoryIds { get; set; } = null!;
        public virtual DbSet<Feature> Features { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Supplier> Suppliers { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(config.GetConnectionString("Northwind"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.AId);

                entity.ToTable("Account");

                entity.Property(e => e.AId).HasColumnName("a_id");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .HasColumnName("password");

                entity.Property(e => e.RId).HasColumnName("r_id");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .HasColumnName("username");

                entity.HasOne(d => d.RIdNavigation)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.RId)
                    .HasConstraintName("FK_Account_Role");
            });

            modelBuilder.Entity<BillImport>(entity =>
            {
                entity.ToTable("BillImport");

                entity.Property(e => e.BillImportId).HasColumnName("bill_import_id");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.DateImport)
                    .HasColumnType("datetime")
                    .HasColumnName("date_import");

                entity.Property(e => e.SupplierId).HasColumnName("supplier_id");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.BillImports)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_BillImport_category_id");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.BillImports)
                    .HasForeignKey(d => d.SupplierId)
                    .HasConstraintName("FK_BillImport_Supplier");
            });

            modelBuilder.Entity<BillOutput>(entity =>
            {
                entity.HasKey(e => e.BillOutId);

                entity.ToTable("BillOutput");

                entity.Property(e => e.BillOutId).HasColumnName("bill_out_id");

                entity.Property(e => e.Amount).HasColumnName("amount");

                entity.Property(e => e.DateSell)
                    .HasColumnType("datetime")
                    .HasColumnName("date_sell");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.BillOutputs)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_BillOutput_Product");
            });

            modelBuilder.Entity<CategoryId>(entity =>
            {
                entity.HasKey(e => e.CategeryId);

                entity.ToTable("category_id");

                entity.Property(e => e.CategeryId).HasColumnName("categery_id");

                entity.Property(e => e.CategoryName)
                    .HasMaxLength(200)
                    .HasColumnName("category_name");

                entity.Property(e => e.DateImport)
                    .HasColumnType("datetime")
                    .HasColumnName("date_import");
            });

            modelBuilder.Entity<Feature>(entity =>
            {
                entity.ToTable("feature");

                entity.Property(e => e.FeatureId).HasColumnName("feature_id");

                entity.Property(e => e.FeatureName)
                    .HasMaxLength(50)
                    .HasColumnName("feature_name");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.DateExpiration)
                    .HasColumnType("datetime")
                    .HasColumnName("date_expiration");

                entity.Property(e => e.DateManufacture)
                    .HasColumnType("datetime")
                    .HasColumnName("date_manufacture");

                entity.Property(e => e.Price)
                    .HasColumnType("numeric(18, 0)")
                    .HasColumnName("price");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(200)
                    .HasColumnName("product_name");

                entity.Property(e => e.Quantity)
                    .HasColumnType("numeric(18, 0)")
                    .HasColumnName("quantity");

                entity.Property(e => e.SupplierId).HasColumnName("supplier_id");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Product_category_id");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.SupplierId)
                    .HasConstraintName("FK_Product_Supplier");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.RId)
                    .HasName("PK_Role_1");

                entity.ToTable("Role");

                entity.Property(e => e.RId).HasColumnName("r_id");

                entity.Property(e => e.RName)
                    .HasMaxLength(50)
                    .HasColumnName("r_name");

                entity.HasMany(d => d.Features)
                    .WithMany(p => p.RIds)
                    .UsingEntity<Dictionary<string, object>>(
                        "RoleFeature",
                        l => l.HasOne<Feature>().WithMany().HasForeignKey("FeatureId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Role_Feature_feature"),
                        r => r.HasOne<Role>().WithMany().HasForeignKey("RId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK_Role_Feature_Role"),
                        j =>
                        {
                            j.HasKey("RId", "FeatureId");

                            j.ToTable("Role_Feature");

                            j.IndexerProperty<int>("RId").HasColumnName("r_id");

                            j.IndexerProperty<int>("FeatureId").HasColumnName("feature_id");
                        });
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.ToTable("Supplier");

                entity.Property(e => e.SupplierId).HasColumnName("supplier_id");

                entity.Property(e => e.SupplierName)
                    .HasMaxLength(100)
                    .HasColumnName("supplier_name");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.AId).HasColumnName("a_id");

                entity.Property(e => e.Address)
                    .HasMaxLength(200)
                    .HasColumnName("address");

                entity.Property(e => e.DateOfBirth)
                    .HasColumnType("datetime")
                    .HasColumnName("date_of_birth");

                entity.Property(e => e.FullName)
                    .HasMaxLength(100)
                    .HasColumnName("full_name");

                entity.HasOne(d => d.AIdNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.AId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_Account");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
