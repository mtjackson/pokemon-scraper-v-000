class Pokemon
  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(id:, name:, type:, db:, hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    x = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: x[0], name: x[1], type: x[2], db: db)
  #  self.all.each do |pokemon|
  #    if pokemon.id == id
  #      self.save(pokemon.name, pokemon.type, db)
  #    end
#    end
  end
end
