require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/employee'
require './lib/division'
require './lib/project'
require 'pry'
also_reload('lib/**/*.rb')


get('/') do
  @all_employees = Employee.all
  @all_projects = Project.all
  @all_divisions = Division.all
  erb(:index)
end

get('/employee/add') do
  erb(:add_employee_form)
end

post('/employee/add') do
  name = params.fetch('employee')
  Employee.create({:name => name})
  redirect('/')
end

get('/project/add') do
  erb(:add_project_form)
end

get('/division/add') do
  erb(:add_division_form)
end

post('/division/add') do
  name = params.fetch('division-name')
  Division.create({:name => name})
  redirect('/')
end

get('/division/:id') do
  @employees = Employee.all
  @division = Division.find(params.fetch('id').to_i)
  @all_projects = Project.all
  erb(:division)
end

delete('/division/:id/delete') do
  @division = Division.find(params.fetch('id').to_i)
  @division.delete
  redirect('/')
end

delete('/employee/:id/delete') do
  @employee = Employee.find(params.fetch('id').to_i)
  @employee.delete
  redirect('/')
end

delete('/project/:id/delete') do
  @project = Project.find(params.fetch('id').to_i)
  @project.delete
  redirect('/')
end

patch('/division/:id/employee') do
  @employee = params['employee'].to_i
  @division = Division.find(params.fetch('id').to_i)
  current_employee = Employee.find(@employee)
  current_employee.update(division_id: @division.id)
  redirect('/')
end

get('/employee/:id') do
  @all_employees = Employee.all
  @all_divisions = Division.all
  @all_projects = Project.all
  @employee = Employee.find(params['id'].to_i)
  erb(:employee)
end

get('/project/:id') do
  @all_employees = Employee.all
  @all_divisions = Division.all
  @all_projects = Project.all
  @project = Project.find(params.fetch('id').to_i)
  erb(:project)
end

patch('/project/:id/employee') do
  @all_employees = Employee.all
  @all_divisions = Division.all
  @all_projects = Project.all
  @project = Project.find(params.fetch('id').to_i)
  employee = Employee.find(params['employee'])
  employee.update(project_id: @project.id)
  erb(:project)
end

post('/project/add') do
  project_name = params['project']
  Project.create(name: project_name)
  redirect('/')
end
