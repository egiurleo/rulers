# frozen_string_literal: true

require 'rulers/version'
require 'rulers/array'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'
require 'rulers/file_model'

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
                { 'Content-Type' => 'text/html' }, []]
      end

      if env['PATH_INFO'] == '/'
        return [301,
                { 'Location' => '/quotes/a_quote' }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
        r = controller.get_response
      rescue StandardError => e
        return [
          500,
          { 'Content-Type' => 'text/html' },
          [e.message]
        ]
      end

      if r
        [r.status, r.headers, [r.body].flatten]
      else
        [200, { 'Content-Type' => 'text/html' },
         [text]]
      end
    end
  end
end
