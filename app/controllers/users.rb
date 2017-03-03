get "/users/new" do
  erb :"/users/new"
end

get "/login" do
  erb :"/users/login"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    @user = false
    erb :"/users/new"
  end
end

post "/login" do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid username or password."]
    erb :"/users/login"
  end
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  @article = Article.where(:user_id => @user.id)
  erb :"/users/index"
end

get "/logout" do
  session.clear
  redirect "/"
end
