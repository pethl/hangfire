Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# PUBLISHABLE_KEY=pk_test_dUk6TyPgdZI64a2JID0LdlkP SECRET_KEY=sk_test_MjCPvqorLLOLhfBWFfoC0Juj rails s