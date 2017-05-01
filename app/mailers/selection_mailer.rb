class SelectionMailer < ApplicationMailer
  def selection_email(request, selection)
    @request = request
    @selection = selection
    mail(to: @request.email, subject: "Here's Your Selection of Books")
  end
end
