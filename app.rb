# frozen_string_literal: true

$routes = ['/', '/home', '/contacts', '/about']

# NotFoundError Rack middleware
class NotFoundError
  def initialize(app)
    @app = app
  end

  def call(env)
    if $routes.include? env['PATH_INFO']
      @app.call(env)
    else
      [404, { 'Contend-Type' => 'text/plain' }, ['Page Not Found']]
    end
  end
end

# Home Redirect Rack middleware
class HomeRedirect
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/home'
      [301, { 'Location' => '/' }, []]
    else
      @app.call(env)
    end
  end
end

# Simple Rack App
class App
  def call(env)
    case env['PATH_INFO']
    when '/'
      [
        200,
        { 'Contend-Type' => 'text/plain' },
        ['Hey there!', 'It is a home page!']
      ]
    when '/contacts'
      [
        200,
        { 'Contend-Type' => 'text/plain' },
        ['Hey there!', 'It is a contacts page!']
      ]
    when '/about'
      [
        200,
        { 'Contend-Type' => 'text/plain' },
        ['Hey there!', 'It is a about page!']
      ]
    end
  end
end
