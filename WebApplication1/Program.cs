﻿using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;

var builder = WebApplication.CreateBuilder(args);
//builder.Configuration
//    .SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("Secrets.json");
//Đăng ký SchoolContext là một DbContext của ứng dụng
builder.Services.AddDbContext<SchoolContext>(options => options
.UseSqlServer(builder.Configuration.GetConnectionString("School")));


// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();
//khởi tạo dữ liệu cho database
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    DbInitializer.Initialize(services);
}

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Learner}/{action=Index}/{id?}");

app.Run();
