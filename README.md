I'm addicted to books. I always have one with me and I can't leave a bookstore without making a purchase. My enthusiasm means that my to-read shelf is encumbered. With almost 600 books, I experience choice overload and can't decide what to read next.

This app emails the user a random set of books from their Goodreads to-read shelf. Users are re-introduced to interesting books and in more manageable quantities.

#How does it use?
This app uses a Rails backend, Nokogiri and open URI to contact the goodreads api, Activejobs with the suckerpunch backend and a mutex to make sure only one request is made at a time, and ActionMailer with sendgrid to send emails.

#How does it work?
The app accepts input from the user using a form. That information is used to make a Request object. If the object is valid then the request added to the Goodreads Job queue and is handles by SuckerPunch. Because the API calls need to be throttled to less than one request per second, as per Goodread's rules, the job locks a mutex, an object that can only be touched by one thing at a time, makes the good reads request, waits one second, and then unlocks the mutex. No other requests can be made while the mutex is locked, effectively throttling the requests to at most 1 request/s.

https://book-overload.herokuapp.com/

www.johnbrock.io
