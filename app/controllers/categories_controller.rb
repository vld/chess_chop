class CategoriesController < ApplicationController
  include TheSortableTreeController::Rebuild
  before_filter :authenticate_admin!, :except => [:show]
    
  def index
    @categories = get_version.categories.nested_set.all
  end
  
  def show
    @category = get_category(params[:id])
    @items = @category.items
  end

  def new
    @category = Category.new
    @version = get_version
  end

  def edit
    @category = get_category(params[:id])
    @version = get_version
  end

  def create
    @category = Category.new(params[:category])
    @category.version = get_version
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
    no_category = Category.find_by_name_and_version_id('--', get_version.id)
    for item in @category.items
      item.update_attributes(:category_id => no_category.id)
    end
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
