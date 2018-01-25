require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "esqueci_minha_senha" do
    mail = UserMailer.esqueci_minha_senha
    assert_equal "Esqueci minha senha", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
