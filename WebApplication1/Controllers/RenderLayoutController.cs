using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class RenderLayoutController : Controller
    {
        private List<MenuItem> MenuItems = new List<MenuItem>();
        public RenderLayoutController()
        {
            MenuItems = new List<MenuItem>() {
                new MenuItem() {Id=1, Name="Branches", Link="Branches/List" },
                new MenuItem() {Id=2, Name="Students", Link="Students/List" },
                new MenuItem() { Id=3, Name="Subjects", Link="Subjects/List"},
                new MenuItem() { Id=4, Name="Courses", Link="Courses/List"}
            };
        }
        public IActionResult RenderLeftMenu()
        {
            return PartialView("RenderLeftMenu", MenuItems);
        }
    }
}
