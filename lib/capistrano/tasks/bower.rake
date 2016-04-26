namespace :bower do
  desc 'Install bower dependencies'
  task :install do
    on roles(:web) do |host|
      within release_path do
       
        execute :bower, :install
        
        execute :bower, :prune
        info "Bower dependencies installed successfully on #{host}"
      end
    end
  end
end