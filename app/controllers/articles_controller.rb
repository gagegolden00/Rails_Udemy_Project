class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  def new
    @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(whitelist_params)
    @article.user = User.first
    if @article.save
      redirect_to @article, notice: "Article was created successfully."
    
    else
      render 'new'
    end
  end
  def update
    if @article.update(whitelist_params)
      redirect_to @article, notice: "Article was updated successfully."
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def whitelist_params
    params.require(:article).permit(:title, :description)
  end

end