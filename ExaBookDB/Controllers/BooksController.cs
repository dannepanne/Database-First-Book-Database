#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ExaBookDB.Models;

namespace ExaBookDB.Controllers
{
    public class BooksController : Controller
    {
        private readonly BookDBContext _context;

        public BooksController(BookDBContext context)
        {
            _context = context;
        }

        // GET: Books
        public async Task<IActionResult> Index(string sortOrder, string searchString)
        {
            //var bookDBContext = _context.Books.Include(b => b.BookAuthor).Include(b => b.BookPublisher);

            ViewData["NameSortParm"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewData["PubSortParm"] = sortOrder == "Publisher" ? "publisher_desc" : "Publisher";
            ViewData["AuthorSortParm"] = sortOrder == "Author" ? "author_desc" : "Author";
            ViewData["GenreSortParm"] = sortOrder == "Genre" ? "genre_desc" : "Genre";
            ViewData["CurrentFilter"] = searchString;
            var books = (from s in _context.Books
                        select s).Include(b => b.BookAuthor).Include(b => b.BookPublisher).ToList();

            if (!String.IsNullOrEmpty(searchString))
            {
                books = books.Where(s => s.BookName.ToLower().Contains(searchString.ToLower())
                                       || s.BookAuthor.FullName.ToLower().Contains(searchString.ToLower())).ToList();
            }
            switch (sortOrder)
            {
                case "name_desc":
                    books = books.OrderByDescending(s => s.BookName).ToList();
                    break;
                case "Author":
                    books = books.OrderBy(s => s.BookAuthor.FullName).ToList();
                    break;
                case "author_desc":
                    books = books.OrderByDescending(s => s.BookAuthor.FullName).ToList();
                    break;
                case "Publisher":
                    books = books.OrderBy(s => s.BookPublisher.PublisherName).ToList();
                    break;
                case "publisher_desc":
                    books = books.OrderByDescending(s => s.BookPublisher.PublisherName).ToList();
                    break;
                
                case "Genre":
                    books = books.OrderBy(s => s.BookGenre).ToList();
                    break;
                case "genre_desc":
                    books = books.OrderByDescending(s => s.BookGenre).ToList();
                    break;
                default:
                    books = books.OrderBy(s => s.BookName).ToList();
                    break;
            }
            return View(books.ToList());
        }


        // GET: Books/Details/5
        public async Task<IActionResult> Details(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var book = await _context.Books
                .Include(b => b.BookAuthor)
                .Include(b => b.BookPublisher)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (book == null)
            {
                return NotFound();
            }

            return View(book);
        }

        // GET: Books/Create
        public IActionResult Create()
        {
            ViewData["BookAuthorId"] = new SelectList(_context.Authors, "Id", "Id");
            ViewData["BookPublisherId"] = new SelectList(_context.Publishers, "Id", "Id");
            return View();
        }

        // POST: Books/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,BookName,BookAuthorId,BookPublisherId,BookDescription,BookGenre,BookLanguage")] Book book)
        {
            if (ModelState.IsValid)
            {
                _context.Add(book);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["BookAuthorId"] = new SelectList(_context.Authors, "Id", "Id", book.BookAuthorId);
            ViewData["BookPublisherId"] = new SelectList(_context.Publishers, "Id", "Id", book.BookPublisherId);
            return View(book);
        }

        // GET: Books/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }
            ViewData["BookAuthorId"] = new SelectList(_context.Authors, "Id", "Id", book.BookAuthorId);
            ViewData["BookPublisherId"] = new SelectList(_context.Publishers, "Id", "Id", book.BookPublisherId);
            return View(book);
        }

        // POST: Books/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Id,BookName,BookAuthorId,BookPublisherId,BookDescription,BookGenre,BookLanguage")] Book book)
        {
            if (id != book.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(book);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookExists(book.Id))
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
            ViewData["BookAuthorId"] = new SelectList(_context.Authors, "Id", "Id", book.BookAuthorId);
            ViewData["BookPublisherId"] = new SelectList(_context.Publishers, "Id", "Id", book.BookPublisherId);
            return View(book);
        }

        // GET: Books/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var book = await _context.Books
                .Include(b => b.BookAuthor)
                .Include(b => b.BookPublisher)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (book == null)
            {
                return NotFound();
            }

            return View(book);
        }

        // POST: Books/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
            var book = await _context.Books.FindAsync(id);
            _context.Books.Remove(book);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool BookExists(long id)
        {
            return _context.Books.Any(e => e.Id == id);
        }
    }
}
