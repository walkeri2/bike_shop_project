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
  @manufacturer = Manufacturer.all
  erb(:inventory)
end

get '/bikeshop/inventory/bymanufacturer' do
  id = params[:manufacturer_id]
  @bikes = Bike.find_by_manufacturer_id(id)
  @manufacturer = Manufacturer.all
  erb(:inventory)
end

get '/bikeshop/inventory/bytype' do
  type = params[:type]
  @bikes = Bike.find_by_type(type)
  @manufacturer = Manufacturer.all
  erb(:inventory)
end

post '/bikeshop/inventory/:id/delete' do
  bike = Bike.find_by_id(params['id'])
  bike.delete
  redirect to '/bikeshop/inventory'
end

post '/bikeshop/manufacturer/:id/delete' do
  manufacturer = Manufacturer.find_by_id(params['id'])
  manufacturer.delete
  redirect to '/bikeshop/manufacturer'
end

post '/bikeshop/manufacturer' do
  Manufacturer.new(params).save
  redirect to '/bikeshop/manufacturer'
end

get '/bikeshop/inventory/:id/edit' do
  @bike = Bike.find_by_id(params['id'])
  @manufacturer = Manufacturer.all
  erb(:edit)
end

post '/bikeshop/inventory/:id' do
  bike = Bike.new(params)
  bike.update
  redirect ("/bikeshop/inventory")
end

get '/bikeshop/inventory/new' do
  @manufacturer = Manufacturer.all
  erb(:new)
end

get '/bikeshop/manufacturer/new' do
  @manufacturer = Manufacturer.all
  erb(:new_manuf)
end

post '/bikeshop/inventory' do
  Bike.new(params).save
  redirect to '/bikeshop/inventory'
end

get '/bikeshop/manufacturer' do
  @manufacturer = Manufacturer.all
  erb(:manufacturer)
end
