class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.esqueci_minha_senha.subject
  #
  def esqueci_minha_senha(usuario, senha)
    @usuario = usuario
    @senha = senha

    mail to: @usuario.email, subject: "Recuperacao de Senha"
  end
end
