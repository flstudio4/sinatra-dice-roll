# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>DICE ROLL</h1>
  <a href='/dice/2/6'>Roll 2 6-sided dice</a><br>
  <a href='/dice/2/10'>Roll 2 10-sided dice</a><br>
  <a href='/dice/1/20'>Roll 1 20-sided dice</a><br>
  <a href='/dice/5/4'>Roll 5 4-sided dice</a>"
  end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for total of #{sum}."
  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  die = rand(1..20)
  "<h1>1d20</h1>
  <p>You rolled #{die}"
end

get("/dice/5/4") do
  die1 = rand(1..4)
  die2 = rand(1..4)
  die3 = rand(1..4)
  die4 = rand(1..4)
  die5 = rand(1..4)

  sum = die1 + die2 + die3 + die4 + die5

  "<h1>5d4</h1>
  <p>You rolled</p>
  <p>#{die1}</p>
  <p>#{die2}</p>
  <p>#{die3}</p>
  <p>#{die4}</p>
  <p>#{die5}</p>
  <p>For a sum of #{sum}</p>"
end
