using System.ComponentModel.DataAnnotations;

namespace StudentDashboard.Web.Models;

public class StudyTask : BaseEntity
{
    [Required]
    public int StudentId { get; set; }
    public Student? Student { get; set; }

    [Required, StringLength(120)]
    public string Title { get; set; } = string.Empty;

    [StringLength(500)]
    public string Description { get; set; } = string.Empty;

    public DateTime DueDate { get; set; } = DateTime.Today.AddDays(1);

    [Required, StringLength(30)]
    public string Priority { get; set; } = "Medium";

    [Required, StringLength(30)]
    public string Status { get; set; } = "Pending";

    public bool IsCompleted { get; set; }

    public override string EntityLabel => $"{Title} ({Status})";
}
