class Employee
	attr_reader :name, :birthday, :age, :cpf, :id, :entry

	def initialize (name, birthday, cpf, id)
		@name = name
		@birthday = birthday
		@age = self.calculateAge()
		@cpf = cpf
		@id = id
		@entry = Date.today
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