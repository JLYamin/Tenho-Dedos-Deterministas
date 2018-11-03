require "employee"

class Company
	attr_accessor :sectors

	def initialize
		@sectors = []
		self.createSectors()
		@operative = false
	end

	def createSectors
		@sectors.push(Sector.new("Executive", @sectors.size))
		@sectors.push(Sector.new("Finances", @sectors.size))
		@sectors.push(Sector.new("Marketing", @sectors.size))
		@sectors.push(Sector.new("Technology", @sectors.size))
		@sectors.push(Sector.new("Normativity", @sectors.size))	
		@sectors.push(Sector.new("Design", @sectors.size))	
	end

	def isOperant?
		@sectors.each do |sector|
			if sector.employees.size < 15
				return @operative = false
			end
		end
		@operative = true
	end

end

class Sector
	attr_accessor :name, :employees, :identifier

	def initialize(name, id)
		@name = name
		@identifier = id 
		@employees = []
	end

	def size
		@employees.size
	end

	def hire (name, birthday, cpf, job, profession)
		emp = Employee.new(name, birthday, cpf, self.defineID)
		emp.employ(job, profession, self) 
		@employees.push(emp)
	end

	def defineID
		year = Date.today.year % 100 
		id   = year * 10000 + @identifier * 1000 + self.size
	end

end