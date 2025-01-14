require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/superheros' do
    superhero = Superhero.all
    superhero.to_json(include: :comments)
  end

  get '/superheros/:id' do
    superhero = Superhero.find(params[:id])
    superhero.to_json
  end

  post '/superheros' do
    superhero = Superhero.create(
      name: params[:name],
      power: params[:power]
    )
    superhero.to_json
  end

  patch '/superheros/:id' do
    superhero = Superhero.find(params[:id])
    superhero.update(
      power: params[:power]
    )
    superhero.to_json
  end

  delete '/superheros/:id' do
    superhero = Superhero.find(params[:id])
    superhero.destroy
    superhero.to_json
  end

  get '/superheros/:id/comments' do
    superhero = Superhero.find(params[:id])
    superhero.to_json(only: [], include: :comments)
  end

  get '/comments' do
    comments = Comment.all
    comments.to_json
  end

  post '/comments' do
    comment = Comment.create(
      text: params[:text],
      superhero_id: params[:superhero_id]
    )
    comment.to_json
  end

end
