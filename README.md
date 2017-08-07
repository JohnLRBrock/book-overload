I'm addicted to books. I always have one with me and I can't leave a bookstore without making a purchase. My enthusiasm means that my to-read shelf is encumbered. With almost 600 books, I experience choice overload and can't decide what to read next.

This app solves that problem by emailing the user a random set of books from their to-read shelf. Users are introduced to books that they were interested in all over again and in more maneagable quantities.

This app uses a Rails backend, Nokogiri and open URI to contact the goodreads api, Activejobs with the suckerpunch backend and a mutex to make sure only one request is made at a time, and ActionMailer with sendgrid to send emails.

This project presented challenges that I hadn't been exposed to before, such as limitting API requests across all users. The project taught me how to learn about new technologies and how to apply problem solving skills to novel problems in a practical context.

The style is sakura which can be found here https://github.com/oxalorg/sakura/blob/master/README.md

https://book-overload.herokuapp.com/

www.johnbrock.io
