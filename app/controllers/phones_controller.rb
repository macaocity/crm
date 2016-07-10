class PhonesController < ApplicationController
  before_action :set_contact
  before_action :set_phone, only: [:show, :edit, :update, :destroy]


  # GET /phones
  # GET /phones.json
  def index
    #@phones = Phone.all
    @phones = @contact.phones.all
  end

  # GET /phones/1
  # GET /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    #@phone = Phone.new
    @phone = @contact.phones.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones
  # POST /phones.json
  def create
    #@phone = Phone.new(phone_params)
    @phone = @contact.phones.new(phone_params)

    respond_to do |format|
      if @phone.save
        #format.html { redirect_to @phone, notice: 'Phone was successfully created.' }
        #format.html { redirect_to @contact, notice: 'Phone was successfully created.' }
        format.html { redirect_to new_contact_phone_path, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1
  # PATCH/PUT /phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        #format.html { redirect_to @phone, notice: 'Phone was successfully updated.' }
        format.html { redirect_to contact_phones_path(@contact), notice: 'Email address was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1
  # DELETE /phones/1.json
  def destroy
    #@phone.destroy
    #respond_to do |format|
      #format.html { redirect_to phones_url, notice: 'Phone was successfully destroyed.' }
      #format.json { head :no_content }
    #end
    
    contact = @phone.contact
    
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to contact, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      #@phone = Phone.find(params[:id])
      @phone = @contact.phones.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_params
      params.require(:phone).permit(:category, :tel)
    end
    
  
end
