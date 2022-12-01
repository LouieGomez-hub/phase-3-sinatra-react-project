class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/superheros' do
    superheros = Superheros.all
    superheros.to_json
  end

  get '/superheros/:id' do
    superhero = Superhero.find(params[:id])
    superhero.to_json(include: :comments)
  end

  get '/comments' do
    comments = Comments.all
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
