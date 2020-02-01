require_relative('../models/bike')
require_relative('../models/manufacturer')


manufacturer1 = Manufacturer.new({'name' => 'Surly'})
manufacturer2 = Manufacturer.new({'name' => 'CoMotion'})
manufacturer3 = Manufacturer.new({'name' => 'BMC'})
manufacturer4 = Manufacturer.new({'name' => 'Moots'})

manufacturer1.save
manufacturer2.save
manufacturer3.save
manufacturer4.save


bike1 = Bike.new({
  'name' => 'Midnight Special',
  'type' => 'Gravel',
  'manufacturer_id' => manufacturer1.id,
  'cost' => 2000,
  'quantity' => 5})

bike2 = Bike.new({
  'name' => 'Karate Monkey',
  'type' => 'Mountain',
  'manufacturer_id' => manufacturer1.id,
  'cost' => 2200,
  'quantity' => 3})

bike3 = Bike.new({
  'name' => 'Espresso',
  'type' => 'Road',
  'manufacturer_id' => manufacturer2.id,
  'cost' => 3200,
  'quantity' => 2})

bike4 = Bike.new({
  'name' => 'Camino',
  'type' => 'Road',
  'manufacturer_id' => manufacturer2.id,
  'cost' => 2800,
  'quantity' => 1})

bike5 = Bike.new({
  'name' => 'Klatch',
  'type' => 'Gravel',
  'manufacturer_id' => manufacturer2.id,
  'cost' => 3100,
  'quantity' => 3})

bike6 = Bike.new({
  'name' => 'Team Machine',
  'type' => 'Road',
  'manufacturer_id' => manufacturer3.id,
  'cost' => 4900,
  'quantity' => 4})

bike7 = Bike.new({
  'name' => 'Agonist',
  'type' => 'Mountain',
  'manufacturer_id' => manufacturer3.id,
  'cost' => 3500,
  'quantity' => 2})

bike8 = Bike.new({
  'name' => 'Speed Fox',
  'type' => 'Mountain',
  'manufacturer_id' => manufacturer3.id,
  'cost' => 4900,
  'quantity' => 3})

bike9 = Bike.new({
  'name' => 'Vamoots',
  'type' => 'Road',
  'manufacturer_id' => manufacturer4.id,
  'cost' => 6800,
  'quantity' => 2})

bike10 = Bike.new({
  'name' => 'Psychlo X',
  'type' => 'Gravel',
  'manufacturer_id' => manufacturer4.id,
  'cost' => 7200,
  'quantity' => 1})

bike1.save
bike2.save
bike3.save
bike4.save
bike5.save
bike6.save
bike7.save
bike8.save
bike9.save
bike10.save
