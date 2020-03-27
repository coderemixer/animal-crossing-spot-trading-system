class Route < Sinatra::Base
  set :show_exceptions, :after_handler
  set :views, settings.root + '/../views'
  register Sinatra::Namespace
  use Rack::Cors do
    allow do
      origins '*'
      resource '/*',
               :methods => [:get, :post, :delete, :put, :patch, :options, :head],
               :headers => :any,
               :expose  => ['Token'],
               :max_age => 600
    end
  end

  use Rack::SSL if ENV['RACK_ENV'] == 'production' # force HTTPS in production

  unless ENV['HOST_DASHBOARD'].nil?
    set :public_folder, ENV['HOST_DASHBOARD']

    get '/' do
      File.read(File.join(ENV['HOST_DASHBOARD'], 'index.html'))
    end
  end

  namespace '/api', &ROOT_ROUTE

  error 500 do |error|
    [
      500,
      {
        exception: error.class,
        message: error.message,
        backtrace: error.backtrace,
      }.to_json
    ]
  end

  error BaseError do |error|
    error.rack
  end
end
