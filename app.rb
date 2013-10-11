require 'sinatra'
require 'sinatra/activerecord'
require './app/models/discussion'
require './app/models/post'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/msg_board.db"


get '/' do
  @discussions = Discussion.all
  erb :index
end

post '/' do
  Discussion.create(title: params[:discussion_title], body: params[:discussion_body])
  redirect to('/')
end

get '/discussion/:discussion_id' do
  @discussion = Discussion.find(params[:discussion_id])
  @posts = @discussion.posts.all
  erb :view
end

post '/discussion/:discussion_id' do
  Post.create(body: params[:discussion_post], discussion_id: params[:discussion_id])
  redirect to("/discussion/#{params[:discussion_id]}")
end



get '/search/:search_text' do
  @results = Discussion.where(title: params[:search_text])
  erb :search
end

post '/search' do
  redirect to("/search/#{params[:search_text]}")
end
