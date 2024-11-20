using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;

namespace WebApplication1.ViewComponents
{
    public class RenderViewComponent:ViewComponent
    {
        private List<MenuItem> MenuItems = new List<MenuItem>();
        public RenderViewComponent()
        {
            MenuItems = new List<MenuItem>() {
                new MenuItem() {Id=1, Name="Courses", Link="Courses/Index"},
                new MenuItem() {Id=2, Name="Learner", Link="Learner/Index"}
            };
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View("RenderLeftMenu",MenuItems); 
        }        
        
    }

}
