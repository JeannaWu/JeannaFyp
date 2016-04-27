Rails.application.configure do
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.assets.initialize_on_precompile = false
   config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js']
  ENV['FACEBOOK_APP_ID'] = "983447761748095";
  ENV['FACEBOOK_SECRET'] = "51537d3016d16513a7c699eb5db19326";
end
