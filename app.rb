require 'sinatra'
require 'sinatra/reloader'
require './lib/employee_tracker'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
