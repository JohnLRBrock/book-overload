class SelectionMailer < ApplicationMailer
  def selection_email(books, email)
    @books = books
    mail(to: email, subject: "Here's Your Selection of Books")
  end
end
