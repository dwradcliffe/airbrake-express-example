namespace :run do
  
  desc "Run app in development mode"
  task :dev do
    system "env NODE_ENV=development coffee app.coffee"
  end
  
  desc "Run app in production mode"
  task :production do
    system "env NODE_ENV=production AIRBRAKE_KEY=69b6240bb01d3a48443e94e2f8cc34ae coffee app.coffee"
  end
  
end

namespace :airbrake do
  
  desc "Notify Airbrake of a new deploy."
  task :deploy do
    system "coffee deploy.coffee"
  end
  
end
