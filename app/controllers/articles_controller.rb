class ArticlesController < ApplicationController
  def index
    @category = Category.find_by_id(params[:category_id])
  end

  def show
    @category = Category.find_by_id(params[:category_id])
    @article = Article.find_by_id(params[:id])
  end

  def new
    @category = Category.find_by_id(params[:category_id])
    @article = @category.articles.build
  end

  def edit
    @category = Category.find_by_id(params[:category_id])
    @article = Article.find_by_id(params[:id])
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @article = @category.articles.new(art_params)

    if @article.save
      redirect_to category_articles_path(@article.category.id)
    else
      render 'new'
    end
  end

  def update
    @category = Category.find_by_id(params[:category_id])
    @article = Article.find_by_id(params[:id])

    if @article.update(art_params)
      redirect_to category_article_path(@category, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy

    redirect_to category_articles_path
  end

  private
    def art_params
      params.require(:article).permit(:title, :body)
    end
end
