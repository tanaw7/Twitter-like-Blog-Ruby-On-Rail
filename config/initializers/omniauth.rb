OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '183919201747476', 'f3bc60b2ad7a4f853fe91a216888833e'
end

