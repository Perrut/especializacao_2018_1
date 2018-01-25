# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/esqueci_minha_senha
  def esqueci_minha_senha
    UserMailer.esqueci_minha_senha
  end

end
