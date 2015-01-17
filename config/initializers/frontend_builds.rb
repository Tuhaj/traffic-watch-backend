require FrontEndBuilds::Engine.root.join('app/controllers/front_end_builds/admin_controller.rb')

class FrontEndBuilds::AdminController

  http_basic_authenticate_with name: ENV['admin_login'], password: ENV['admin_password']

end
