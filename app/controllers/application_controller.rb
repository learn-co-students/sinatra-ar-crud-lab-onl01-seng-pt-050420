
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article2 = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article2 = Article.find(params[:id])
    @article2.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article2 = Article.find(params[:id])
    Article.delete(@article2)
    redirect "/"
  end


end
