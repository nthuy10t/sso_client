Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sso, "public", "secret"
end