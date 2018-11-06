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

	def size
		total = 0
		@sectors.each do |sector|
			total += sector.size
		end
		total
	end

	def hire (name, birthday, cpf, sector, job, profession)
		@sectors[@@departments.index(sector)].hire(name, birthday, cpf, job, profession)
	end

	def calc(id)
		(id/1000)%10
	end

	def fire (id)
		@sectors[calc(id)].fire(id)
	end

	def find (id)
		@sectors[calc(id)].find(id)
	end

	def raiseSalary (id, value)
		@sectors[calc(id)].raiseSalary(id, value)
	end

	def promote (id)
		@sectors[calc(id)].promote(id)
	end

	def grantBonus (id)
		@sectors[calc(id)].grantBonus(id)
	end

end

class Sector
	attr_accessor :name, :employees, :identifier

	def initialize(name, id)
		@name = name
		@identifier = id 
		@employees = []
		@counter = 0
	end

	def size
		@employees.size
	end

	def hire (name, birthday, cpf, job, profession)
		emp = Employee.new(name, birthday, cpf, self.defineID)
		emp.employ(job, profession, self) 
		@counter += 1
		@employees.push(emp)
		# case profession
		# 	when 'Administrator', 'Accountant', 'Economist'
		# 	when 'Social Communicator', 
		# 	when 'Eng. da Computação', 'Eng. de Sistemas', 'Eng. da Informação'
				
		# end
	end

	def find (id)
		@employees.each do |employee|
			if employee.id == id
				return employee
			end
		end
		throw :InexistentEmployee
	end

	def fire (id)
		@employees.delete(self.find(id))
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
		id   = year * 10000 + @identifier * 1000 + @counter
	end

end