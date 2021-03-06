require 'sinatra/base'
require './config/environment'

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do 
    erb :index
  end

  post '/teams' do
    @team = Team.new(params[:team]) 
      params[:team][:superheroes].each do |details|
        Superhero.new(details)
      end

    @superheroes = Superhero.superheroes
    erb :teams
  end



end
