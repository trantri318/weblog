class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = "Register success"
      redirect_to categories_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end
end
