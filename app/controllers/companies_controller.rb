class CompaniesController < ApplicationController
  before_action :set_contact
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    #@companies = Company.all
    @companies = @contact.companies.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    #@company = Company.new
    @company = @contact.companies.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    #@company = Company.new(company_params)
    @company = @contact.companies.new(company_params)

    respond_to do |format|
      if @company.save
        #format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.html { redirect_to new_contact_company_path, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        #format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.html { redirect_to contact_companies_path(@contact), notice: 'Email address was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    contact = @company.contact
    
    @company.destroy
    respond_to do |format|
      format.html { redirect_to contact, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Nested, all email address method is under posts/:id
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      #@company = Company.find(params[:id])
      @company = @contact.companies.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:comp_name, :comp_tel, :comp_addr, :comp_country, :comp_city, :title)
    end
end
