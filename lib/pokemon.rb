class Pokemon
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (? , ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    pokemon = self.new(id: id, name: row[1], type: row[2], db: db)
    pokemon
  end

  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end
end
