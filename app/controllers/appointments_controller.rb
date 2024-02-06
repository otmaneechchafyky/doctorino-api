class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: %i[show destroy update]
    def index
        @appointments = []
        @appointments_list = Appointment.all
        @appointments_list.each do |appointment|
          @appointments << {
            data: AppointmentSerializer.new(appointment).serializable_hash[:data][:attributes],
            animal: AnimalSerializer.new(appointment.animal).serializable_hash[:data][:attributes],
            vet: VetSerializer.new(appointment.vet).serializable_hash[:data][:attributes]
          }
        end
        render json: @appointments
    end

    def show
        render json: {
            data: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes],
            animal: AnimalSerializer.new(@appointment.animal).serializable_hash[:data][:attributes],
            vet: VetSerializer.new(@appointment.vet).serializable_hash[:data][:attributes]
        }
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            render json: { message: 'Appointment created successfully.',
            animal: AnimalSerializer.new(@appointment.animal).serializable_hash[:data][:attributes],
            vet: VetSerializer.new(@appointment.vet).serializable_hash[:data][:attributes] },
            status: :created
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
