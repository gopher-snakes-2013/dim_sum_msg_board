require 'sinatra'
require 'sinatra/activerecord'
require './app/models/discussion'
set :database, "sqlite3:///db/msg_board.db"


get '/' do
  @discussions = Discussion.all
  erb :index
end
