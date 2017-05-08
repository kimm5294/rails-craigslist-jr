class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def create
    @category = Category.new(cat_params)

    if @category.save
      redirect_to category_articles_path(@category.id)
    else
      render 'new'
    end
  end

  def update
    @category = Category.find_by_id(params[:id])

    if @category.update(cat_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find_by_id(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def cat_params
      params.require(:category).permit(:name)
    end
end
