# frozen_string_literal: true

# Simple Rack App
class App
  def call(env)
    [200, { 'Contend-Type' => 'text/plain' }, ['Hello!']]
  end
end
