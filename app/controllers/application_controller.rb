
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello world!"
  end
  
  get '/articles' do 
    @articles = Article.all 
    erb :index
  end
  
  get '/articles/:id' do 
    @article = Article.all.select do |article|
      article.id = params[:id]
    end.first
    erb :show
  end
  
  get '/articles/new' do 
    
    erb :new
  end
  
  
  
  
end
