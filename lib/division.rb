class Division < ActiveRecord::Base
  has_many(:employees)

  # def self.add_employee(employee_id, division_id)
  #   employee = Division.find(employee_id)
  #   employee.update(:division_id => employee.id)
  # end

end
