require './config/environment'

use Rack::MethodOverride
use RecipesController
use UsersController
run ApplicationController