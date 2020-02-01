require_relative('../db/sql_runner')

class Bike

  attr_accessor :name, :type, :cost, :quantity, :manufacturer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @manufacturer_id = options['manufacturer_id'].to_i
    @cost = options['cost'].to_i
    @quantity = options['quantity'].to_i
  end


  def save()
    sql = "INSERT INTO bikes(name, type, manufacturer_id, cost, quantity) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @type, @manufacturer_id, @cost, @quantity]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE bikes SET(name, type, manufacturer_id, cost, quantity) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@name, @type, @manufacturer_id, @cost, @quantity]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bikes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bikes"
    bike_data = SqlRunner.run(sql)
    bikes = map_items(bike_data)
    return bikes
  end

  def self.map_items(bike_data)
    return bike_data.map { |bike| Bike.new(bike)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM bikes WHERE ID = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    bike = Bike.new(result)
    return bike
  end 

  def manufacturer()
    manufacturer = Manufacturer.find(@manufacturer_id)
    return manufacturer
  end

end
