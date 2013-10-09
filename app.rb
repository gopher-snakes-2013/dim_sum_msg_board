require 'sinatra'
require 'sinatra/activerecord'
require './app/models/discussion'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/msg_board.db"


get '/' do
  @discussions = Discussion.all
  erb :index
end

post '/' do
  Discussion.create(title: params[:discussion_title], body: params[:discussion_body])
  redirect to('/')
end

get '/discussions/:id' do
  @discussion = Discussion.find(params[:id])
  erb :view
end
