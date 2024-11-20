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

        public IActionResult CourseFilter(int? mid, string? keyword, int? pageIndex)
        {
            //lấy toàn bộ courses trong dbset chuyển về IQuerrable<Course> để dùng Lingq
            var courses = (IQueryable<Course>)db.Courses;
            //lấy chỉ số trang, nếu chỉ số trang null thì gán ngầm định bằng 1
            int page = (int)(pageIndex == null || pageIndex <= 0 ? 1 : pageIndex);
            //nếu có mid thì lọc course theo mid (chuyên ngành)
            if (mid != null)
            {
                courses = courses.Where(l => l.CourseID == mid); //lọc
                ViewBag.mid = mid; //gửi mid về view để ghi lại trên nav-trang
            }
            //nếu có keyword thì tìm kiếm theo tên
            if (keyword != null)
            {
                courses = courses.Where(l => l.Title == keyword); //tìm kiếm
                ViewBag.keyword = keyword; //gửi keyword về view để ghi lại trên nav-trang
            }
            //tính số trang
            int pageNum = (int)Math.Ceiling(courses.Count() / (float)pageSize);
            ViewBag.pageNum = pageNum; //gửi số trang về view để hiển thị nav-trang
            //chọn dữ liệu trong trang hiện tại
            var result = courses.Skip(pageSize * (page - 1))
                            .Take(pageSize)
                            ;
            return PartialView("CourseTable", result);
        }
        public IActionResult CourseByCourseID(int mid)
        {
            var courses = db.Courses
                .Where(l => l.CourseID == mid).ToList();
            return PartialView("CourseTable", courses);
        }

        public IActionResult SearchByName(string keyword)
        {
            var courses = db.Courses
                .Where(l => l.Title.ToLower()
                            .Contains(keyword.ToLower()))
                .ToList();
            return PartialView("CourseTable", courses);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("CourseID,Title,Credits")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View();
        }

        public IActionResult Edit(int id)
        {
            if (id == null || db.Courses == null)
            {
                return NotFound();
            }

            var course = db.Courses.Find(id);
            if (course == null)
            {
                return NotFound();
            }
            return View(course);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("CourseID,Title,Credits")] Course course)
        {
            if (id != course.CourseID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    db.Update(course);
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CourseExists(course.CourseID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(course);
        }
        private bool CourseExists(int id)
        {
            return (db.Courses?.Any(e => e.CourseID == id)).GetValueOrDefault();
        }

        // GET: Products/Delete/5
        public IActionResult Delete(int id)
        {
            if (id == null || db.Courses == null)
            {
                return NotFound();
            }

            var course = db.Courses
                .Include(e => e.Enrollments)
                .FirstOrDefault(m => m.CourseID == id);
            if (course == null)
            {
                return NotFound();
            }
            if (course.Enrollments.Count() > 0)
            {
                return Content("This course has some enrollments, can't delete!");
            }
            return View(course);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            if (db.Courses == null)
            {
                return Problem("Entity set 'Courses' is null.");
            }
            var course = db.Courses.Find(id);
            if (course != null)
            {
                db.Courses.Remove(course);
            }

            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
    }
}
