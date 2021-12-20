using System;
using System.Collections.Generic;

namespace ExaBookDB.Models
{
    public partial class Author
    {
        public Author()
        {
            Books = new HashSet<Book>();
        }

        public long Id { get; set; }
        public string? AuthorFirstName { get; set; }
        public string? AuthorLastName { get; set; }
        public string? AuthorAge { get; set; }
        public string? AuthorNationality { get; set; }
        public string? AuthorAlive { get; set; }

        public virtual ICollection<Book> Books { get; set; }
        public string FullName => AuthorFirstName + " " + AuthorLastName;
    }
}
