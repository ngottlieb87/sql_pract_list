require("sinatra")
require("sinatra/loader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

DB = PG.connect({:dbname=>"to_do"})

get ('/') do
  @tasks = Task.all()
  @list = List.all()
end
