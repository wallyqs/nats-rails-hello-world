Rails.application.routes.draw do
  get '/greetings', to: 'root#greetings'
  get '/streaming', to: 'root#streaming'
end
