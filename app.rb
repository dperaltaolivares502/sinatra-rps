require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1> Welcome to Rock-Paper-Scissors!</h1>
  
  "
end

# create a route for the homepage
get '/' do
  # render the homepage template
  erb :index
end

# create a post route to handle the form submission
post '/play' do
  # get the player's choice from the params
  player_choice = params[:choice]

  # generate a random choice for the computer
  computer_choice = ['rock', 'paper', 'scissors'].sample

  # set the result variable to store the outcome
  result = ""

  # check for a tie
  if player_choice == computer_choice
    result = "It's a tie! You both chose #{player_choice}."
  # check for player wins
  elsif (player_choice == "rock" && computer_choice == "scissors") || (player_choice == "paper" && computer_choice == "rock") || (player_choice == "scissors" && computer_choice == "paper")
    result = "Congratulations, you win! #{player_choice} beats #{computer_choice}."
  # if the above conditions are not met, the computer wins
  else 
    result = "Sorry, you lost. #{computer_choice} beats #{player_choice}."
 