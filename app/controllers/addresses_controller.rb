class AddressesController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # POST /contacts/1/address
  def create
    @contact.address = address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created, location: contact_address_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # GET contacts/1/phones
  def show
    render json: @contact.address
  end

  # PATCH/PUT /kinds/1
  def update
    if @contact.address.update(address_params)
        render json: @contact.address
    else
        render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def address_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

end
