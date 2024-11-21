using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Data;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class CoursesController : Controller
    {
        private SchoolContext db;
        public CoursesController(SchoolContext context)
        {
            db = context;
        }
        //khai báo biến toàn cục pageSize
        private int pageSize = 3;
        public IActionResult Index(int? mid)
        {
            var courses = (IQueryable<Course>)db.Courses;
            if (mid != null)
            {
                courses = (IQueryable<Course>)db.Courses
                    .Where(l => l.CourseID == mid);
            }
            //tính số trang
            int pageNum = (int)Math.Ceiling(courses.Count() / (float)pageSize);
            //trả số trang về view để hiển thị nav-trang
            ViewBag.pageNum = pageNum;
            //lấy dữ liệu trang đầu
            var result = courses.Take(pageSize).ToList();
            return View(result);
        }

    }
}
