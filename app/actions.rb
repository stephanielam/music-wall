configure do
  enable :sessions
end

get '/' do
  redirect to('/songs')
end

get '/login' do
  erb :login
end

post '/login' do 
  user = User.find_by(username: params[:username])
  if user && params[:password] == user.password 
    session[:user] = user.id
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
  @user = User.find(session[:user])
  erb :index
end

get '/songs/new' do
  @user = User.find(session[:user])
  erb :new
end

post '/songs' do
  @user = User.find(session[:user])
  @track = Track.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url],
    user_id: @user.id
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