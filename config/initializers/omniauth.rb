OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '983447761748095', '51537d3016d16513a7c699eb5db19326'
  provider :twitter, 'aIrCRWqvduBCxOk0usnbB5jCU', 'kjJteFzQdiUOfaOLdakGgxH0OYURjpC0l6hnK9yp6YOR354Ced'
  provider :tumblr, 'tQJeDNqB8e7endSR2anXQ39eQ04fN9lSgyhreHm4f0XTp65EB8','show'
  provider :instagram, '809a61dbec2d4dde81c9b2bb30e9f23b','7d20431539fd4b408e78d5ff6ae49b2a'
end