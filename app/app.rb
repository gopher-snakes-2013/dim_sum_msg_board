require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:///db/msg_board.db"

##check modular sinatra application thing
# class Discussion < ActiveRecord::Base
# end

