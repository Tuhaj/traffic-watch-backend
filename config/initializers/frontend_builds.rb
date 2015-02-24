require FrontEndBuilds::Engine.root.join('app/controllers/front_end_builds/application_controller.rb')

class FrontEndBuilds::ApplicationController

  http_basic_authenticate_with name: ENV['admin_login'], password: ENV['admin_password']

end
