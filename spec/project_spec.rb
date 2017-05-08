describe(Project) do
  describe('#employees') do
    it('tells which employees it has') do
      test_division = Division.create({name: "HR"})
      test_project = Project.create({name: "Rebuild Church"})
      test_employee_1 = Employee.create({name: "Joe", division_id: test_division.id, project_id: test_project.id})
      test_employee_2 = Employee.create({name: "Joe", division_id: test_division.id, project_id: test_project.id})
      expect(test_project.employees).to eq([test_employee_1, test_employee_2])
    end
  end
end
