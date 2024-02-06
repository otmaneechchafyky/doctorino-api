class AnimalsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_animal, only: %i[show update destroy] 

    def index # Get animals list 
        @animals_list = Animal.all
        @animals = []
        @animals_list.each do |animal|
            @animals << {
                data: AnimalSerializer.new(animal).serializable_hash[:data][:attributes],
                animal_owner: UserSerializer.new(animal.owner).serializable_hash[:data][:attributes]
            }
        end
        render json: @animals
    end

    def show # animals/:id
        render json: {
            data: AnimalSerializer.new(@animal).serializable_hash[:data][:attributes],
            animal_owner: UserSerializer.new(@animal.owner).serializable_hash[:data][:attributes],
            animal_genre: GenreSerializer.new(@animal.genre).serializable_hash[:data][:attributes]
        }
    end

    def destroy # Delete animals/:id
        @animal.destroy
        render json: { message: 'Animal deleted successfully.'}, status: :ok
    end

    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            render json: { message: 'Animal created successfully.',
            animal: AnimalSerializer.new(@animal).serializable_hash[:data][:attributes] },
            status: :created
        else
            render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @animal.update(animal_params)
            render json: { message: 'Animal updated successfully.',
            animal: AnimalSerializer.new(@animal).serializable_hash[:data][:attributes] },
            status: :ok
        else
            render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end

    def animal_params
        params.require(:animal).permit(:name, :animal_photo, :date_of_birth, :weight, :escape_attempts, :owner_id, :genre_id)
    end
end
