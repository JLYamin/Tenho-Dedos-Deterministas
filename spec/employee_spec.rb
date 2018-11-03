require "date"
require "employee"
require "company"

describe Employee do 

	before(:each) do
		sector = Sector.new("Technology")
    @employee = Employee.new("John", Date.new(1998,1,18), "888.888.888-88", 88, 880.00, true, sector, "Auxiliar", "Eng. da Computação")
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
		expect(@employee.salary).to be_a Float
	end

	it "should show if a employee have a transportation voucher or not" do 
		expect(@employee.voucher).not_to be_nil
	end

	it "should belong to a sector" do
		expect(@employee.sector).to be_a Sector
	end

	it "should have a job" do 
		expect(@employee.job).to be_a String
	end

	it "should have a profession" do 
		expect(@employee.profession).to be_a String
	end
end