using System;
using System.Collections.Generic;

namespace ExaBookDB.Models
{
    public partial class Book
    {
        public long Id { get; set; }
        public string? BookName { get; set; }
        public long? BookAuthorId { get; set; }
        public long? BookPublisherId { get; set; }
        public string? BookDescription { get; set; }
        public string? BookGenre { get; set; }
        public string? BookLanguage { get; set; }

        public virtual Author? BookAuthor { get; set; }
        public virtual Publisher? BookPublisher { get; set; }
    }
}
