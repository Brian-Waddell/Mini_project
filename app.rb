require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do

  
  erb(:home)
end 

get("/user_word") do 
   
  
  @ans = params.fetch("users_words")
 pp @ans 
  raw_ans = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{@ans}")

  pro = JSON.parse(raw_ans)

 @solution =  pro[0].fetch("meanings")[0].fetch("definitions")[0].fetch("definition")
 @meanings =  pro[0].fetch("meanings")
 

  erb(:results)
end   

=begin
get ("/:user_word/:results") do 


 @ans = params.fetch("user_word")

  raw_ans = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{@ans}")

  pro = JSON.parse(raw_ans)

 @solution = pro.fetch("meanings")


 erb(:results)
end 
=end
