post "/users/:id/articles" do
  @idea = params[:idea]
  @title = Wikipedia.find(@idea).title
  @url = Wikipedia.find(@idea).fullurl
  @article = Article.new(idea: @idea, title: @title, url: @url, user_id: params[:id])
  if @article.save
    redirect "/users/#{params[:id]}"
  else
    @errors = @article.errors.full_messages
    redirect "/users/#{params[:id]}"
  end
end

get "/users/:id/articles/:id" do
  @user = User.find_by(id: params[:id])
  @article = Article.find_by(id: params[:id])
  @full_text = Wikipedia.find(@article.idea).text
 erb :"/articles/show"
end
