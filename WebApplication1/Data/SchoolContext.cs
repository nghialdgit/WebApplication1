using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.Data
{
    public class SchoolContext : DbContext
    {
        public SchoolContext(DbContextOptions<SchoolContext> options) 
            : base(options) { }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Learner> Learners { get; set; }
        public virtual DbSet<Enrollment> Enrollments { get; set; }
        public virtual DbSet<Major> Majors { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Major>().ToTable(nameof(Major));
            modelBuilder.Entity<Course>().ToTable(nameof(Course));
            modelBuilder.Entity<Learner>().ToTable(nameof(Learner));
            modelBuilder.Entity<Enrollment>().ToTable(nameof(Enrollment));
            /*
            modelBuilder.Entity<Learner>(entity =>
            {
                entity.HasOne(d => d.Major)
                .WithMany(p => p.Learners)
                .HasForeignKey(k => k.MajorID)
                .HasConstraintName("FK_Learner_Major_MajorID");
            });
            
            modelBuilder.Entity<Enrollment>(entity => {
                entity.HasOne(d => d.Learner)
                .WithMany(p => p.Enrollments)
                .HasForeignKey(k => k.LearnerID)
                .HasConstraintName("FK_Enrollment_Learner_LearnerID");

                entity.HasOne(d => d.Course)
                .WithMany(p => p.Enrollments)
                .HasForeignKey(k => k.CourseID)
                .HasConstraintName("FK_Enrollment_Course_CourseID");
            });
            */
        }
    }
}
