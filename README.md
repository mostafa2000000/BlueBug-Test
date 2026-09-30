# BlueBug-Test
# Five lines

1. The main issue was extracting the rating because the site represents it as a CSS class (One, Two, etc.) rather than a numeric value.
2. Selenium made the pagination and DOM extraction straightforward, but browser startup adds overhead compared with direct HTTP requests.
3. The first five pages contain the required 100 books, so no individual book-page requests are necessary.
4. If the site started blocking after 50 requests, I would slow the request rate and add explicit waits/backoff rather than repeatedly retrying immediately.
5. I would also cache already-scraped pages and resume from the last successful page instead of starting over.
