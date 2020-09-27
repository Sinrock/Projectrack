# frozen_string_literal: true

require './config/environment'

raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' if ActiveRecord::Migrator.needs_migration?

use Rack::MethodOverride
use ProjectsController
use UsersController

run ApplicationController
