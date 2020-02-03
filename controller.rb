require('sinatra')
require('sinatra/contrib/all')
require_relative('models/bike')
require_relative('models/manufacturer')
also_reload("./models/*")
require('pry')

get '/bikeshop' do
  erb(:home)
end


get '/bikeshop/inventory' do
  @bikes = Bike.all
  erb(:inventory)
end

get '/bikeshop/inventory/new' do
  erb(:new)
end

post '/bikeshop/inventory' do
  Bike.new(params).save
  redirect to '/bikeshop/inventory'
end

get '/bikeshop/manufacturer' do
  @manufacturer = Manufacturer.all
  erb(:manufacturer)
end

get '/bikeshop/mountain' do
  @bikes = Bike.get_by_category("Mountain")
  erb(:mountain)
end

get '/bikeshop/road' do
  @bikes = Bike.get_by_category("Road")
  erb(:road)
end

get '/bikeshop/gravel' do
  @bikes = Bike.get_by_category("Gravel")
  erb(:gravel)
end
