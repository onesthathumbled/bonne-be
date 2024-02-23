class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:show, :edit, :update, :destroy]
  
    def index
      @categories = Category.all
      render json: @categories
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        # redirect_to @category, notice: 'Category was successfully created.'
        render json: @category
      else
        # render :new
        render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @category.update(category_params)
        redirect_to @category, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @category.soft_delete  # Assuming you have soft deletion implemented
      redirect_to categories_url, notice: 'Category was successfully deleted.'
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.permit(:category_name)
    end
  end
  