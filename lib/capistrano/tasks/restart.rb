namespace :passenger do
  desc 'Restart passenger app'
  task :restart do
    on roles(:app), in: :sequence, wait: 5, limit: 2 do |host|
      execute :'passenger-config', 'restart-app', fetch(:deploy_to), '--ignore-app-not-running'
      info "Restart passenger successfully on #{host}"
    end
  end
end