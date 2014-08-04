OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '306201809551361', '78259e03ab25b96aef8ddf72ce306f61', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end