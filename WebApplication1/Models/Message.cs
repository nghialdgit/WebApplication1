namespace WebApplication1.Models
{
    public class Message
    {
        public string msg { get; set; }
        public int pgnum { get; set; }
        public Message(string msg, int pgnum)
        {
            this.msg = msg;
            this.pgnum = pgnum;
        }
        public Message() { }
    }
}
