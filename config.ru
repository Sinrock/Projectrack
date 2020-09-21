require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#here is where I will mount other controller 'use'

#in order to send PATCH and DelETE requests I need this code
'use Rack::MethodOverride'

run ApplicationController
