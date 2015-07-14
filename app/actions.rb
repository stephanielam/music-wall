configure do
  enable :sessions
  set :username, 'USER'
  set :password, 'pass'
end

get '/' do
  redirect to('/songs')
end

get '/login' do
  erb :login
end

post '/login' do 
  if params[:username] == settings.username && params[:password] == settings.password 
    session[:user] = params[:username]
    redirect '/songs'
  else
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end

get '/songs' do
  erb :index
end

get '/songs/new' do
  erb :new
end

post '/songs' do
 @track = Track.new(
    title: params[:title],
    author: params[:author],
    url:  params[:url]
  )
  @track.save
  redirect '/songs'
end


# List      GET /songs
# show      GET /songs/1
# new       GET /songs/new
# create    POST /songs
# edit      GET /songs/1/edit
# update    PUT /songs
# delete    DELETE /songs/1