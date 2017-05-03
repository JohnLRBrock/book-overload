class ApplicationMailer < ActionMailer::Base
  default from: 'Librarian@bookoverload.heroku.com'
  layout 'mailer'
end
