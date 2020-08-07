
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #index --grab ALL of the articles
  get '/articles' do 
    @articles = Article.all
    erb :index
  end 

  # show, grab 1 article
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  #new
  get 'articles/new' do 
    erb :new
  end 

  #create 
  post '/articles' do 
    #a HTML forms
    @article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end 

  #update , need a form
  get '/articles/:id/edit' do 
    erb :edit 
  end 

  #update
  patch '/articles/:id' do 
    # Although we want to send a PATCH request to /articles/:id to process the form, we have to be a little sneaky to trick HTML into letting us do something besides a GET or a POST
  end 

  #delete, add delete button to the show.erb, will be a form that's blank w/ only the delete button
  delete 'articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end 

end
