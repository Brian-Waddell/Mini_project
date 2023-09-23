require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do

  
  erb(:home)
end 

get("/:user_word") do 
   
  
  @ans = params.fetch("user_word")

  raw_ans = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{@ans}")

  pro = JSON.parse(raw_ans)

 @solution = pro.fetch("definition")

  erb(:second)
end 

get ("/:user_word/:results") do 


 @ans = params.fetch("user_word")

  raw_ans = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{@ans}")

  pro = JSON.parse(raw_ans)

 @solution = pro.fetch("definition")


 erb(:results)
end 
