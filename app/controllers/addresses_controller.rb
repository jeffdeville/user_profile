class AddressesController < ApplicationController
  # GET /users/[user_id]/addresses
  # GET /users/[user_id]/addresses.json
  def index
    @addresses = current_user.addresses.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  # GET /users/[user_id]/addresses/1
  # GET /users/[user_id]/addresses/1.json
  def show
    @address = current_user.addresses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  # GET /users/[user_id]/addresses/new
  # GET /users/[user_id]/addresses/new.json
  def new
    @address = Address.new
    @address.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  # GET /users/[user_id]/addresses/1/edit
  def edit
    @address = current_user.addresses.find(params[:id])
  end

  # POST /users/[user_id]/addresses
  # POST /users/[user_id]/addresses.json
  def create
    @address = Address.new(params[:address])
    @address.user = current_user

    respond_to do |format|
      if @address.save
        format.html { redirect_to user_address_path(current_user, @address), notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/[user_id]/addresses/1
  # PUT /users/[user_id]/addresses/1.json
  def update
    @address = current_user.addresses.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to user_address_path(current_user, @address), notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/[user_id]/addresses/1
  # DELETE /users/[user_id]/addresses/1.json
  def destroy
    @address = current_user.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to user_addresses_path(current_user) }
      format.json { head :no_content }
    end
  end
end
