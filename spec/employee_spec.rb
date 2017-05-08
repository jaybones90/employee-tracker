require('spec_helper')



describe(Employee) do

  describe('#division') do
    it('tells which division its in') do
      test_division = Division.create({:name => "HR"})
      test_employee_1 = Employee.create({:name => "Joe", :division_id => test_division.id})
      test_employee_2 = Employee.create({:name => "Jim", :division_id => test_division.id})
      expect(test_employee_1.division).to eq(test_division)
    end
  end

  describe('#project') do
    it('tells which project it has') do
      test_division = Division.create({name: "HR"})
      test_project = Project.create({name: "Rebuild Church"})
      test_employee_1 = Employee.create({name: "Joe", division_id: test_division.id, project_id: test_project.id})
      test_employee_2 = Employee.create({name: "Joe", division_id: test_division.id, project_id: test_project.id})
      expect(test_employee_1.project).to eq(test_project)
    end
  end

end
