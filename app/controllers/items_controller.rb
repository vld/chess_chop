class ItemsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show, :index]
  
  def index
    @items = get_version.items
  end

  def show
    @item = get_item(params[:id])
  end

  def new
    @item = Item.new
    @categories = get_version.categories
  end

  def edit
    @item = get_item(params[:id])
    @categories = get_version.categories
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        @categories = get_version.categories
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = get_item(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        @categories = get_version.categories
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = get_item(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
  
  def load_from_excel
  end
  
  def upload_from_excel
    file = ExcelUploader.new
    file.store!(params[:excel_file])
    sheet1 = Spreadsheet.open("#{file.store_path}").worksheets[0]
    @items = []
    counter = 0
    @errors = Hash.new
    sheet1.each do |row|
      counter += 1
      item = Item.new
      item.title = row[0]
      item.category = Category.find_by_name(row[1])
      item.price = row[2]
      if item.valid?
        @items << item
      else
        @errors[counter.to_s] = item.errors
      end
    end
    @items.each {|i| i.save} unless @errors.any? 
    file.remove!
  end
  
  private
  
  def get_item(id)
    Item.find(id)
  end
end
