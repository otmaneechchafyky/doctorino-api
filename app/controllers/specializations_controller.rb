class SpecializationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @specializations = []
    @specializations_list = Specialization.all
    @specializations_list.each do |specialization|
      @specializations << SpecializationSerializer.new(specialization).serializable_hash[:data][:attributes]
    end
    render json: @specializations
  end
end
