require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname=>"to_do"})

get ('/') do
  @tasks = Task.all()
  @list = List.all()
  erb(:input)
end

post ("/") do
  list = params['name']
  task = params['description']
  new_list = List.new({:name=>list, :id => @id})
  new_task = Task.new({:description=> task, :list_id => @list_id})
  new_list.save()
  new_task.save()
  @tasks = Task.all()
  @list = List.all()
  erb(:to_do)
end
