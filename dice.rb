require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
 erb(:turtles)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart your server"
end


get("/dice/2/6") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)
  sum = first_dice + second_dice

  @outcome = "You rolled #{first_dice} and #{second_dice} for a total of #{sum}."
  erb(:two_six, {:layout => :wrapper})
end

get("/dice/2/10") do
  first_dice = rand(1..10)
  second_dice = rand(1..10)
  sum = first_dice + second_dice

  @outcome = "You rolled #{first_dice} and #{second_dice} for a total of #{sum}."
  erb(:two_ten, {:layout => :wrapper})
end

get("/dice/1/20") do
  icosahedron = rand(1..20)

  @outcome = "You rolled a #{icosahedron} on your virtual shiny math rock."
  erb(:one_twenty, {:layout => :wrapper})
end

get("/dice/5/4") do
  first_dice = rand(1..4)
  second_dice = rand(1..4)
  third_dice = rand(1..4)
  fourth_dice = rand(1..4)
  fifth_dice = rand(1..4)
  sum = first_dice + second_dice + third_dice + fourth_dice + fifth_dice

 @outcome = "You rolled #{first_dice}, #{second_dice}, #{third_dice}, #{fourth_dice}, and #{fifth_dice} for a total of #{sum}."
 erb(:five_four, {:layout => :wrapper})
end

get("/dice/fireball") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)
  third_dice = rand(1..6)
  fourth_dice = rand(1..6)
  fifth_dice = rand(1..6)
  sixth_dice = rand(1..6)
  seventh_dice = rand(1..6)
  eighth_dice = rand(1..6)
  total_damage  = first_dice + second_dice + third_dice + fourth_dice + fifth_dice + sixth_dice + seventh_dice + eighth_dice

  @outcome = "You casted Fireball at level 3. Your shiny math rocks clink around [#{first_dice}, #{second_dice}, #{third_dice}, #{fourth_dice}, #{fifth_dice}, #{sixth_dice}, #{seventh_dice}, #{eighth_dice}] for a total of #{total_damage} fire damage "
 erb(:fireball, {:layout => :wrapper})

end

get("/dice/greatsword") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)

  sum = first_dice + second_dice

  @outcome = "You swing your greatsword [#{first_dice}, #{second_dice}] for a total of #{sum} slashing damage."
  erb(:greatsword, {:layout => :wrapper})
end 

get("/dice/greataxe") do
  axe_dice = rand(1..12)

  @outcome = "You swing your greatsword for a total of #{axe_dice} slashing damage."
  erb(:greataxe, {:layout => :wrapper})
end 
