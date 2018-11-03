class Employee
	attr_reader   :name, :birthday, :age, :cpf, :id, :entry, :profession
	attr_accessor :sector, :salary, :voucher, :job, :employed

	def initialize (name, birthday, cpf, id)
		@name = name
		@birthday = birthday
		@age = self.calculateAge()
		@cpf = cpf
		@id = id
		@entry = Date.today

		@employed = false
	end

	def employ (job, profession, sector)
		if (!@employed)
			@job = job
			@profession = profession
			@sector = sector
			@voucher = false
			self.defineSalary()
			@employed = true
		end
	end

	def defineSalary
			case job
				when "Assistant"
					@salary  = 1500.00
					@voucher = true
				when "Technician"
					@salary  = 3000.00
					@voucher = true
				when "Professional"
					@salary  = 6500.00
				when "Director"
					@salary  = 9500.00
				when "COO"
					@salary  = 13000.00
				when "CEO"
					@salary  = 18000.00
				else 
					throw :InvalidJob				
			end
	end

	def calculateAge
	  now = Date.today
	  age = now.year - birthday.year
	  if (now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day))
	  	age -= 1
	  end
	  age
	end

end