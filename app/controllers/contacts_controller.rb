class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
  end

  def new
  end

  # POST /contacts or /contacts.json
  def create
    ContactMailer.contact_mail(contact_params).deliver_now
    redirect_to root_path, notice: "Contact was successfully created."
    # t(".contact_success")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:content, :image, :email).merge(room_number: current_user.room_number, name: current_user.name)
  end
end
