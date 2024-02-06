class VetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vet, only: %i[show destroy update]
  def index
    @vets = []
    @vets_list = Vet.all
    @vets_list.each do |vet|
      @vets << {
        data: VetSerializer.new(vet).serializable_hash[:data][:attributes],
        specialization: SpecializationSerializer.new(vet.specialization).serializable_hash[:data][:attributes]
      }
    end
    render json: @vets
  end

  def show
    render json: {
      data: VetSerializer.new(@vet).serializable_hash[:data][:attributes],
      specialization: SpecializationSerializer.new(@vet.specialization).serializable_hash[:data][:attributes]
    }
  end

  def destroy
    @vet.destroy
    render json: { message: 'Vet deleted successfully.'}, status: :ok
  end

  def create
    @vet = Vet.new(vet_params)
    if @vet.save
        render json: { message: 'Vet created successfully.',
        vet: VetSerializer.new(@vet).serializable_hash[:data][:attributes] },
        status: :created
    else
        render json: { errors: @vet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @vet.update(vet_params)
        render json: { message: 'Vet updated successfully.',
        updated_vet: VetSerializer.new(@vet).serializable_hash[:data][:attributes] },
        status: :ok
    else
        render json: { errors: @vet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_vet
    @vet = Vet.find(params[:id])
  end

  def vet_params
    params.require(:vet).permit(:name, :vet_photo, :available_from, :available_to, :fees, :bio, :specialization_id)
  end
end
