class EmailAddressesController < ApplicationController
  before_action :set_contact
  before_action :set_email_address, only: [:show, :edit, :update, :destroy]
  

  # GET /email_addresses
  # GET /email_addresses.json
  def index
    #@email_addresses = EmailAddress.all
    @email_addresses = @contact.email_addresses.all
  end

  # GET /email_addresses/1
  # GET /email_addresses/1.json
  def show
  end

  # GET /email_addresses/new
  def new
    @email_address = @contact.email_addresses.new
  end

  # GET /email_addresses/1/edit
  def edit
  end

  # POST /email_addresses
  # POST /email_addresses.json
  def create
    #@email_address = EmailAddress.new(email_address_params)
    @email_address = @contact.email_addresses.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        #format.html { redirect_to @email_address, notice: 'Email address was successfully created.' }
        format.html { redirect_to @contact, notice: 'Email address was successfully created.' }
        format.json { render :show, status: :created, location: @email_address }
      else
        format.html { render :new }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_addresses/1
  # PATCH/PUT /email_addresses/1.json
  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address, notice: 'Email address was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_address }
      else
        format.html { render :edit }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /email_addresses/1
  # DELETE /email_addresses/1.json
  def destroy
    contact = @email_address.contact
    
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to contact, notice: 'Email address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Nested, all comments method is under posts/:id
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_email_address
      #@email_address = @contact.EmailAddresses.find(params[:id])
      @email_address = @contact.email_addresses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_address_params
      params.require(:email_address).permit(:email)
    end
    
    
end
