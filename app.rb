require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require './app/models/discussion'
require './app/models/post'
require './app/models/user'

set :database, ENV['DATABASE_URL'] || "sqlite3:///db/msg_board.db"


def space_replacer(search_term)
  search_term.gsub!( " ", "_" ) 
end

def wildcarder(search_param)
  search_param.gsub!("_" , "%")
  search_param.insert( 0 , '%')
  search_param.insert(-1 , '%')
end




get '/' do
  @discussions = Discussion.all
  erb :index
end

post '/' do
  user = User.find_by! username: params[:username]
  if user.password == params[:password]
    Discussion.create(title: params[:discussion_title], body: params[:discussion_body], user_id: user.id )
    redirect to('/')
  else
    redirect to('/')
  end
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
  @discussion_results = Discussion.where("title || body like ?", "#{wildcarder(params[:search_text])}") 
  
  erb :search
end

post '/search' do
  space_replacer(params[:search_text])
  redirect to("/search/#{params[:search_text]}")
end

post '/new_user' do
  User.create(username: params[:new_username], password: params[:new_password], acct_type: 'user')
  redirect to '/'

end
