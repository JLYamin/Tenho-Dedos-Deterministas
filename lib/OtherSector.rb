require_relative "OtherEmployee"
require_relative "../assets/colors"

#Setores possiveis: finanças(2), marketing(3), tecnologia(4), normatividade(5) e design(6)
#Cada setor possui auxiliares, tecnicos, profissionais, e diretores

=begin 
The class Sector defines the amount of sectors inside the company
Every sector has a name, the professionals allowed on the specific sector,
the director id of the sector and the director of the specific sector.
=end

class OtherSector

  @@curr_id = 0    # number of sectors created until now

  def self.get_quantity_Sectors()
      return @@curr_id
  end

  def initialize(sector_name, professions, director=nil) 
    @@curr_id += 1
    @sector_id = @@curr_id
    @sector_name = sector_name
    @allowed_professionals = professions
    @director = director
    @quantity_employees = 0
  end     
  
  # Checks if a prospective employee can be in that specific sector. This happens if at least one of the employees formations is in the allowed professions of the sector.
  # Auxiliar and Técnico can be from any line of formation.
  def check_employee(employee) 
    flag = employee.get_formation()
    if employee.get_Job() == nil
      role = ""
    else
      role = employee.get_role()
    end

    if @allowed_professionals & flag != [] or role == "Auxiliar" or role == "Técnico"
      return true
    else
      return false
    end
  end

  # Amount of employees in this sector
  def get_employee_amount()
    return @quantity_employees 
  end

 
  # Add a new employee to this sector
  def add_employee(new_employee)
    if !new_employee.instance_of? Employee
      raise ArgumentError, "Argument provided is not an Employee.".red
    end
    if check_employee(new_employee) == true
      @quantity_employees += 1
      new_employee.set_sector(self)
      return true
    else 
      puts "WARNING!".yellow + " This employee's profession is not allowed for this sector."
      return false
    end
  end

  # Removes employee from this sector
  def rm_employee(employee)
    if !employee.instance_of? Employee
      raise ArgumentError, "Argument provided is not an Employee.".red
    end
    @quantity_employees -= 1
    employee.set_sector(nil)
  end

  # Returns which profession the current sector accepts
  def get_allowed_professions()
    return @allowed_professionals
  end
 
  def add_allowed_profession( *args )
    @allowed_professionals.push(*args)
  end

  def rm_allowed_profession( old_profession )
    @allowed_professionals.delete(old_profession)
  end

  # Returns the sector name
  def get_sector_name() 
    return @sector_name
  end

  def get_sector_id()
    return @sector_id
  end

  def set_sector_name( new_name )
    @sector_name = new_name
  end
  
 def get_director()
    return @director
  end 
 
  # Defines a new director for a new sector.  
  def set_director(director)
    if !director.instance_of? Employee
      raise ArgumentError, "ERROR!".red + " Argument provided is not an Employee."
    else
      @director = director
    end
  end  
  
end

