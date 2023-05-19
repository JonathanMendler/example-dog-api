class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render :index
  end

  def show
    @dog = Dog.find_by(id: params["id"])
    render :show
  end

  def create
    @dog = Dog.create(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
    )

    if @dog.valid?
      render :show
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @dog = Dog.find_by(id: params["id"])
    @dog.update(
      name: params["name"] || @dog.name,
      age: params["age"] || @dog.age,
      breed: params["breed"] || @dog.breed,
    )

    if @dog.valid?
      render :show
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @dog = Dog.find_by(id: params["id"])
    @dog.destroy
    render json: { message: "File successfully destroyed" }
  end
end
