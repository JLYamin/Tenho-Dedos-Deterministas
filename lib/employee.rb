class Employee
	attr_reader   :name, :birthday, :age, :cpf, :id, :entry, :profession
	attr_accessor :sector, :salary, :voucher, :job

	def initialize (name, birthday, cpf, id, salary, voucher, sector, job, profession)
		@name = name
		@birthday = birthday
		@age = self.calculateAge()
		@cpf = cpf
		@id = id
		@entry = Date.today
		@salary = salary
		@voucher = voucher
		@sector = sector
		@job = job
		@profession = profession
	end

	def employ

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