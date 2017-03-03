post "/users/:id/articles" do
  @user = current_user
  @idea = params[:idea]
  if @idea.empty? == false
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
   # @errors = ["You got to put something!"]
    redirect "/users/#{@user.id}"
  end
end

get "/users/:user_id/articles/:id" do
  article_id = params[:id].to_i
  @this_article = Article.find_by(id: article_id)
  @full_text = Wikipedia.find(@this_article.idea).text
  @user = User.find_by(id: params[:user_id])
  if request.xhr?
    erb :"/articles/_front_show", layout: false, locals: {this_article: @this_article, full_text: @full_text}
  else
    erb :"/articles/show"
  end
end

delete "/articles/:id" do
  @article = Article.find_by(id: params[:id])
  @article.destroy
  redirect "/users/#{current_user.id}"
end
