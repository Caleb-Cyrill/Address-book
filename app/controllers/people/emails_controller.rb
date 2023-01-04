class People::EmailsController < ApplicationController
  before_action :set_person
  before_action :set_email, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!
  # GET /emails or /emails.json
  def index
    @emails = @person.emails
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = @person.emails.build
  end
  
  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = @person.emails.build(email_params)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @person, notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { redirect_to new_person_email_path([@person, @email]), status: :unprocessable_entity, alert: "Invalid email format" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @person, notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { redirect_to person_email_path, status: :unprocessable_entity, alert: "Invalid email format" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html { redirect_to @person, notice: "Email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = @person.emails.find(params[:id])
    end

    def set_person
      @person = Person.find(params[:person_id])
    end
    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:email, :comments)
    end
end