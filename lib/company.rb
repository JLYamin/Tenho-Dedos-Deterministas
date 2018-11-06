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

	def fire (id)
		@employees.each do |emp|
			if emp.id==id
				@employees.delete(emp)
			end
		end
	end

	def promote(id)
		@employees.each do |emp|
			if emp.id==id
				case emp.job
					when "Assistant"
						emp.job = "Technician"
					when "Technician"
						emp.job = "Professional"
					when "Professional"
						emp.job = "Director"
					when "Director"
						emp.job = "COO"
					when "COO"
						emp.job = "CEO"
					when "CEO"
						emp.job = "CEO"
					else
						throw :InvalidJob
				end
				@employees
			end
		end
	end

	def grantBonus(id)
		@employees.each do |emp|
			if emp.id==id
				case emp.job
					when "Assistant"
						emp.salary = emp.salary * 1.00
					when "Technician"
						emp.salary = emp.salary * 1.00
					when "Professional"
						emp.salary = emp.salary * 1.00
					when "Director"
						emp.salary = emp.salary * 1.02
					when "COO"
						emp.salary = emp.salary * 1.02
					when "CEO"
						emp.salary = emp.salary * 1.02
					else
						throw :InvalidJob
				end
				@employees
			end
		end
	end

	def raiseSalary(id, value)
		@employees.each do |emp|
			if emp.id==id
				emp.salary = emp.salary + value
			end
		end
		@employees
	end

	def defineID
		year = Date.today.year % 100 
		id   = year * 10000 + @identifier * 1000 + self.size		#se contratar alguém, depois contratar outro alguém, e demitir um deles, o size vai voltar 1 numero. 
																	#Da próxima vez que contratar alguém, esta pessoa terá o mesmo id que a última pessoa contratada.
																	#Talvez se usar um contador como variável de classe?
	end

end