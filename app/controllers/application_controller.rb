
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
  
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/show' do
    new_article = Article.create(title: params[:title], content: params[:content])
    new_article.save

    redirect "articles/#{new_article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    original_article = Article.find(params[:id])
    original_article.update(title: params[:title], content: params[:content])

    redirect "/articles/#{original_article.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy

    erb :delete
  end

end
