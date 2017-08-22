class Member
  attr_reader :name,
              :role,
              :party,
              :district,
              :senority

  def initialize(attributes = {})
    @name = attributes[:name]
    @role = attributes[:role]
    @party = attributes[:party]
    @district = attributes[:district]
    @senority = attributes[:senority].to_i
  end
end
