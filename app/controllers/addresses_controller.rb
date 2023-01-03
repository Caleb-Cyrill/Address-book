class AddressesController < ApplicationController
  before_action :set_person
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!
  # GET /addresses or /addresses.json
  def index
    @addresses = @person.addresses
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    
    @address = @person.addresses.build
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    
    @address = @person.addresses.build(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to [@person, @address], notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { redirect_to new_person_address_path, status: :unprocessable_entity, alert:"Invalid address" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [@person, @address], notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { redirect_to person_address_path, status: :unprocessable_entity, alert:"Invalid address" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to [@person, :addresses], notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end
    
    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :town, :zip_code, :state, :country)
    end
end
