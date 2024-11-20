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
                new MenuItem() {Id=1, Name="Courses", Link="Courses/Index"},
                new MenuItem() {Id=2, Name="Learner", Link="Learner/Index"}
            };
        }
        public IActionResult RenderLeftMenu()
        {
            return PartialView("RenderLeftMenu", MenuItems);
        }
    }
}
