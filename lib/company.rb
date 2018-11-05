require "employee"

class Company
	attr_accessor :sectors

	def initialize
		@@departments = ["Executive", "Finances", "Marketing", "Technology", "Normativity", "Design"]
		@sectors = []
		self.createSectors()
		@operative = false
	end

	def createSectors
		for i in 0..5 do 
			@sectors.push(Sector.new(@@departments[i], i))
		end
	end

	def isOperant?
		@sectors.each do |sector|
			if sector.employees.size < 15
				return @operative = false
			end
		end
		@operative = true
	end

	def hire (name, birthday, cpf, sector, job, profession)
		@sectors[@@departments.index(sector)].hire(name, birthday, cpf, job, profession)
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
		# case profession
		# 	when 'Administrator', 'Accountant', 'Economist'
		# 	when 'Social Communicator', 
		# 	when 'Eng. da Computação', 'Eng. de Sistemas', 'Eng. da Informação'
				
		# end
	end

	def defineID
		year = Date.today.year % 100 
		id   = year * 10000 + @identifier * 1000 + self.size
	end

end