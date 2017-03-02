def current_user
  @user ||= User.find_by(id: session[:user_id])
end

def require_login
  redirect "/login" unless session['user_id']
end

def require_owner(user_id)
  redirect '/' unless user_id == current_user.id
end
