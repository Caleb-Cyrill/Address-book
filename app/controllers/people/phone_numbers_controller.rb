class People::PhoneNumbersController < ApplicationController
  before_action :set_person
  before_action :set_phone_number, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!
  # GET /phone_numbers or /phone_numbers.json
  def index
    @phone_numbers = @person.phone_numbers
  end

  # GET /phone_numbers/1 or /phone_numbers/1.json
  def show
  end

  # GET /phone_numbers/new
  def new
    @phone_number = @person.phone_numbers.build
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers or /phone_numbers.json
  def create
    @phone_number = @person.phone_numbers.build(phone_number_params)

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @person, notice: "Phone number was successfully created." }
        format.json { render :show, status: :created, location: @phone_number }
      else
        format.html { redirect_to new_person_phone_number_path([@person, @phone_number]), status: :unprocessable_entity, alert:"Invalid number format" }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1 or /phone_numbers/1.json
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @person, notice: "Phone number was successfully updated." }
        format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { redirect_to person_phone_number_path, status: :unprocessable_entity, alert:"Invalid number format" }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1 or /phone_numbers/1.json
  def destroy
    @phone_number.destroy

    respond_to do |format|
      format.html { redirect_to @person, notice: "Phone number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end
    
    # Only allow a list of trusted parameters through.
    def phone_number_params
      params.require(:phone_number).permit(:phone_number, :comments)
    end
end
