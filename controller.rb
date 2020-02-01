require('sinatra')
require('sinatra/contrib/all')
require_relative('models/bike')
require_relative('models/manufacturer')
also_reload('./models/*')

get '/bikeshop' do
  erb(:home)
end


get '/bikeshop/inventory' do
  @bikes = Bike.all
  erb(:inventory)
end

get '/bikeshop/manufacturer' do
  erb(:manufacturer)
end

get '/bikeshop/mountain' do
  erb(:mountain)
end

get '/bikeshop/road' do
  erb(:road)
end

get '/bikeshop/gravel' do
  erb(:gravel)
end
