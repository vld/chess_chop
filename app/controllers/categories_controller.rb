class CategoriesController < ApplicationController
  include TheSortableTreeController::Rebuild
  
  def index
    @categories = Category.nested_set.all
  end
  
  def show
    @category = get_category(params[:id])
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def edit
    @category = get_category(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = get_category(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = get_category(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def get_category(id)
    Category.find(id)
  end
end
