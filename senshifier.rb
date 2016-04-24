class Senshifier < BasicObject
  attr_reader :senshi 
  def initialize
    @senshi = ""
    @info_level = 0
  end
  def indent(string)
    " " * @info_level + string.to_s
  end
  def method_missing(m, &block)
    @senshi << indent(m) + ":"
    @senshi << "\n"
    @info_level += 2
    @senshi << indent(yield(self)) if block
    @info_level -= 2
    @senshi << "\n"
    return ""
  end
end

senshi = Senshifier.new

senshi.soldiers do |soldier|
  soldier.moon do |moon|
    moon.last_name { "Tsukino" }
    moon.first_name { "Usagi" }
    moon.powers { "Personality, Tiara, Staff, Determination" }
  end
  soldier.jupiter do |j|
    j.last_name { "Kino" }
    j.first_name { "Makoto" }
    j.power { "Martial Arts, Cooking, Lightning, Loyalty" }
  end
end

puts senshi.senshi