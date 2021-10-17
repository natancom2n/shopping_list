defmodule ShoppingListWeb.PowResetPassword.MailerView do
  use ShoppingListWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
