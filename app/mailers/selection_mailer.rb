class SelectionMailer < ApplicationMailer
  def selection_email(books, email)
    puts "mail is being sent. #{books}"
    @books = books
    mail(to: email, subject: "Here's Your Selection of Books")
  end
end
