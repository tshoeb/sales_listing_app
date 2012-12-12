class PurchasesController < ApplicationController
  # GET /purchases
  # GET /purchases.json
  def index
    @title = "Shopping Cart"
    @purchases = Purchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @title = "Your Purchase"
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @title = "Buy"
   # @purchase = Purchase.new
    @purchase = current_user.purchases.new

    if @purchase.save
      UserMailer.new_purchase_msg(@purchase).deliver
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @title = "Edit Order"
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    id = params[:id]
    @purchase = current_user.purchases.new()
    @purchase.product_id = id
    @product = Product.find(id)
    @product.available = false
    @purchase.purchase_date = Date.today
    @purchase.delivery_date = 10.days.from_now
    respond_to do |format|
      if @purchase.save && @product.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created and email sent' }
        format.json { render json: @purchase, status: :created, location: @purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully made and email sent to you.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
  def availability(id)
    productid = id
    products_list = Product.all.map{|product| product}
    products_list.each do|product|
      if product.id == productid
        product.available = false
      end
    end
  end
end
