require "employee"
require "date"

describe Employee do 

	before(:each) do
    @employee = Employee.new("John", Date.new(1998,1,18), "888.888.888-88", 88)
  end

	it "should have a name" do
		expect(@employee.name).to be_a String
	end

	it "should have a birthday" do 
		expect(@employee.birthday).to be_a Date
	end

	it "should have an age" do 
		expect(@employee.age).to be_a Integer
	end

	it "should have a CPF" do
		expect(@employee.cpf).to be_a String
	end

	it "should have an ID" do 
		expect(@employee.id).to be_a Integer
	end

	it "should have an entry date" do 
		expect(@employee.entry).to be_a Date
	end

	it "should have a salary" do 
		
	end

end