
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do

    erb :new
  end

  #POST - CREATE & SAVE NEW ARTICLE
  post '/articles' do
    title = params[:title]
    content = params[:content]
    @article = Article.create(title: title, content: content)

    redirect "/articles/#{@article.id}"
  end

  #INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #SHOW
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #PATCH
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])

    redirect "/articles/#{@article.id}"
  end

  #DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end


end
