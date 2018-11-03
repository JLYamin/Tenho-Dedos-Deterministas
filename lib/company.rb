class Company
	attr_accessor :sectors

	def initialize
		@sectors = []
		self.createSectors()
	end

	def createSectors
		@sectors.push(Sector.new("Executive"))
		@sectors.push(Sector.new("Finances"))
		@sectors.push(Sector.new("Marketing"))
		@sectors.push(Sector.new("Technology"))
		@sectors.push(Sector.new("Normativity"))	
		@sectors.push(Sector.new("Design"))	
	end
end

class Sector
	attr_accessor :name, :employees

	def initialize(name)
		@name = name
		@employees = []
	end

end