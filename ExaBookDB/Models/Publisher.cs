using System;
using System.Collections.Generic;

namespace ExaBookDB.Models
{
    public partial class Publisher
    {
        public Publisher()
        {
            Books = new HashSet<Book>();
        }

        public long Id { get; set; }
        public string? PublisherName { get; set; }
        public string? PublisherAdress { get; set; }
        public string? PublisherPhoneNumber { get; set; }
        public string? PublisherEmail { get; set; }

        public virtual ICollection<Book> Books { get; set; }
    }
}
