# @!visibility private
# Leave API docs for API docs
ROOT_ROUTE = proc do
  get '/status' do
    'The Service is Running...'
  end
end
