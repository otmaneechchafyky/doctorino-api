class SpecializationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @specializations_list = Specialization.all
    render json: @specializations_list, each_serializer: SpecializationSerializer
  end
end
