require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:///msg_board.db"


get '/' do
  # @discussions = Discussions.all
  "Hello world"
end
