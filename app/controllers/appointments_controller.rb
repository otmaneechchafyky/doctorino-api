class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: %i[show destroy update]
    def index
        @appointments_list = Appointment.all
        render json: @appointments_list, each_serializer: AppointmentSerializer
    end

    def show
        render json: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes]
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            render json: {message: 'Appointment created successfully.'}, status: ok
        else
            render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @appointment.destroy
        render json: { message: 'Appointment deleted successfully.'}, status: :ok
    end

    private

    def set_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:date, :time, :location, :duration, :animal_id, :vet_id)
    end
end
