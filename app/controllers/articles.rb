post "/users/:id/articles" do
  @user = current_user
  @idea = params[:idea]
  if !@idea.empty?
    @title = Wikipedia.find(@idea).title
    @url = Wikipedia.find(@idea).fullurl
    @article = Article.new(idea: @idea, title: @title, url: @url, user_id: params[:id])
    if @article.save
      redirect "/users/#{params[:id]}"
    else
    @errors = @article.errors.full_messages
    redirect "/users/#{params[:id]}"
    end
  else
    @errors = ["You got to put something!"]
    erb :"/users/index"
  end
end

get "/users/:user_id/articles/:article_id" do
  @user = User.find_by(id: params[:user_id])
  @article = Article.find_by(id: params[:article_id])
  @full_text = Wikipedia.find(@article.idea).text
  erb :"/articles/show"
end
