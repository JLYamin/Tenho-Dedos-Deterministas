require "company"
# require "employee"
require "OtherEmployee"
require "OtherJob"
require "date"

describe "Integration" do

	before(:each) do
		# Setup da nossa empresa
    @company = Company.new
    @company.hire("John", Date.new(1998,1,18), "888.888.888-82", "Technology", "Assistant", "Computer Engineering")
    @company.hire("Anna", Date.new(1998,1,18), "888.888.888-83", "Finances", "Technician", "Accountant")
    @company.hire("Karen", Date.new(1998,1,18), "888.888.888-84", "Design", "Assistant", "Graphic Designer")
    @company.hire("Leia", Date.new(1998,1,18), "888.888.888-85", "Technology", "Assistant", "Systems Engineering")
    @company.hire("Tim", Date.new(1998,1,18), "888.888.888-86", "Normativity", "Professional", "Lawyer")
    @company.hire("Lola", Date.new(1998,1,18), "888.888.888-87", "Marketing", "Assistant", "Marketer")
  
    # Setup para a empresa deles
    @job_1 = OtherJob.new('Assistant', 1500)
    @employee_1 = OtherEmployee.new(name: 'Jose', birth_date: Time.parse('25/03/1997'), cpf: '111.111.111-00', join_date: Time.parse('10/02/2005'), bonus: 350.00, role: @job_1, sector: 'Finances', formation:["Administrator", "Gestor de Pessoas"])
  end

	it "should be able to export a employee at the original company" do
		employee = @company.transferOut(185000) #Karen
		expect(@company.size).to eq (5)
		expect(employee.name).to eq ("Karen")
	end

	it "should be able to import a employee from another company" do
		@company.transferIn(@employee_1)
		expect(@company.sectors[1].employees.last.name).to eq ("Jose")
	end

end