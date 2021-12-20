using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ExaBookDB.Models
{
    public partial class BookDBContext : DbContext
    {
        public BookDBContext()
        {
        }

        public BookDBContext(DbContextOptions<BookDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Author> Authors { get; set; } = null!;
        public virtual DbSet<Book> Books { get; set; } = null!;
        public virtual DbSet<Publisher> Publishers { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=BookDB;Integrated Security=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Author>(entity =>
            {
                entity.ToTable("authors");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AuthorAge)
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("author_age");

                entity.Property(e => e.AuthorAlive)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("author_alive");

                entity.Property(e => e.AuthorFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("author_first_name");

                entity.Property(e => e.AuthorLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("author_last_name");

                entity.Property(e => e.AuthorNationality)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("author_nationality");
            });

            modelBuilder.Entity<Book>(entity =>
            {
                entity.ToTable("books");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BookAuthorId).HasColumnName("book_author_id");

                entity.Property(e => e.BookDescription)
                    .HasColumnType("text")
                    .HasColumnName("book_description");

                entity.Property(e => e.BookGenre)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("book_genre");

                entity.Property(e => e.BookLanguage)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("book_language");

                entity.Property(e => e.BookName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("book_name");

                entity.Property(e => e.BookPublisherId).HasColumnName("book_publisher_id");

                entity.HasOne(d => d.BookAuthor)
                    .WithMany(p => p.Books)
                    .HasForeignKey(d => d.BookAuthorId)
                    .HasConstraintName("FK_books_authors");

                entity.HasOne(d => d.BookPublisher)
                    .WithMany(p => p.Books)
                    .HasForeignKey(d => d.BookPublisherId)
                    .HasConstraintName("FK_books_publishers");
            });

            modelBuilder.Entity<Publisher>(entity =>
            {
                entity.ToTable("publishers");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.PublisherAdress)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("publisher_adress");

                entity.Property(e => e.PublisherEmail)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("publisher_email");

                entity.Property(e => e.PublisherName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("publisher_name");

                entity.Property(e => e.PublisherPhoneNumber)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("publisher_phone_number");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
