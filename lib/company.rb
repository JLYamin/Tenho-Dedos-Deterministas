require "employee"

#Classe responsável pelo comportamento da Empresa
class Company
	attr_accessor :sectors

	# Inicializa com os departamentos, cria os setores e inoperativa por ter menos de 15 funcionários por setor
	def initialize
		@@departments = ["Executive", "Finances", "Marketing", "Technology", "Normativity", "Design"]
		@sectors = []
		self.createSectors()
		@operative = false
	end

	# Cria os setores
	def createSectors
		for i in 0..5 do 
			@sectors.push(Sector.new(@@departments[i], i))
		end
	end

	# Verifica se cada setor tem mais de 15 funcionários
	def isOperant?
		@sectors.each do |sector|
			if sector.employees.size < 15 && sector.name != "Executive"
				return @operative = false
			end
		end
		@operative = true
	end

	# Retorna total de funcionários na empresa
	def size
		total = 0
		@sectors.each do |sector|
			total += sector.size
		end
		total
	end

	# Contrata um funcionário
	def hire (name, birthday, cpf, sector, job, profession)
		@sectors.each do |sec| 
			sec.employees.each do |emp|
				if emp.cpf == cpf
					throw :InvalidCPF
				end
			end
		end
		if @@departments.index(sector) == nil
			throw :InvalidSector
		end
		@sectors[@@departments.index(sector)].hire(name, birthday, cpf, job, profession)
	end

	# Calcula o setor do funcionário a partir do ID do mesmo
	def calc(id)
		(id/1000)%10
	end

	# Demite um funcionário
	def fire (id)
		@sectors[calc(id)].fire(id)
	end

	# Encontra um funcionário
	def find (id)
		@sectors[calc(id)].find(id)
	end

	# Aumenta o salário de um funcionário
	def raiseSalary (id, value)
		@sectors[calc(id)].raiseSalary(id, value)
	end

	# Promove um funcionário
	def promote (id)
		@sectors[calc(id)].promote(id)
	end

	# Dá bônus a um funcionário
	def grantBonus (id)
		@sectors[calc(id)].grantBonus(id)
	end

	# Define a média dos salários da empresa
	def average
		sum = 0
		@sectors.each do |sector|
			if sector.size != 0
				sector.employees.each do |emp|
					sum += emp.salary
				end
			end
		end
		sum / self.size
	end

	# Demite um funcionário para a transferência do mesmo para outra empresa
	def transferOut (id)
		emp = self.find(id)
		self.fire(id)
		emp
	end

	def transferIn (employee)
		self.hire(employee.get_name, Time.parse(employee.get_birth_date), employee.get_cpf, employee.get_sector, employee.get_role, employee.get_formation.first)
	end

end

# Classe responsável pelo funcionamento do setor
class Sector
	attr_accessor :name, :employees, :identifier

	# Inicializa o setor com zero funcionários
	def initialize(name, id)
		@name = name
		@identifier = id 
		@employees = []
		@counter = 0
	end

	# Total de funcionários
	def size
		@employees.size
	end

	# Contrata um funcionário neste setor
	def hire (name, birthday, cpf, job, profession)
		emp = Employee.new(name, birthday, cpf, self.defineID)
		if @identifier == 0
			@employees.each do |emp|
				if emp.job == job 
					throw :JobAlreadyOccupied
				end
			end
		end
		emp.employ(job, profession, self) 
		@counter += 1
		@employees.push(emp)
	end

	# Encontra um funcionário neste setor
	def find (id)
		@employees.each do |employee|
			if employee.id == id
				return employee
			end
		end
		throw :InexistentEmployee
	end

	# Demite um funcionário neste setor
	def fire (id)
		@employees.delete(self.find(id))
	end

	# Promove um funcionário neste setor
	def promote(id)
		@employees.each do |emp|
			if emp.id==id
				case emp.job
					when "Assistant"
						emp.job = "Technician"
						emp.defineSalary
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
				emp.defineSalary
				@employees
			end
		end
	end

	# Dá bônus a um funcionário neste setor
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

	# Aumenta o salário de um funcionário neste setor
	def raiseSalary(id, value)
		@employees.each do |emp|
			if emp.id==id
				emp.salary = emp.salary + value
			end
		end
		@employees
	end

	# Define a média dos salários do setor
	def average
		if (self.size != 0)
			sum = 0
			@employees.each do |emp|
				sum += emp.salary
			end
			(sum / self.size)
		end
	end

	# Define o ID de um funcionário recém contratado
	def defineID
		year = Date.today.year % 100 
		id   = year * 10000 + @identifier * 1000 + @counter
	end

end