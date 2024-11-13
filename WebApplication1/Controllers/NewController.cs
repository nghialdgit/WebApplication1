using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    [Route("Show")]
    public class NewController : Controller
    {
        //url: Show/Blog
        [Route("Blog")]
        [Route("Blog/Article",Name = "ten")]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult MyAction()
        {
            return Problem("Lỗi");
        }
        public IActionResult NhanThamSo(int id, string name)
        {
            ViewBag.Id = id;
            ViewBag.Name = name;
            return View();
        }
        public IActionResult CreateMsg()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CreateMsg(Message m)
        {
            ViewData["Message"] = m;
            return View();
        }
    }
}
