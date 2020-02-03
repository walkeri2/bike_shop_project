require_relative('../db/sql_runner.rb')

class Manufacturer

  attr_reader :id, :name


  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO manufacturers(name)VALUES($1)RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    manufacturer = Manufacturer.new(result)
    return manufacturer
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturer_data = SqlRunner.run(sql)
    manufacturers = map_items(manufacturer_data)
    return manufacturers
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.map_items(manufacturer_data)
    return manufacturer_data.map { |manufacturer| Manufacturer.new(manufacturer)}
  end


end
