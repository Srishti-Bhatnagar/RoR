class FarmersController < ApplicationController
  before_action :authenticate_user!


def index
	@farmers = Farmer.all

	render json: @farmers
end

  
 def show
    render json: @farmer
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @farmer = Farmer.new(task_params)

    if @farmer.save
      render json: @farmer, status: :created, location: @farmer
    else
      render json: @farmer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @farmer.update(task_params)
      head :no_content
    else
      render json: @farmer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @farmer.destroy

    head :no_content
  end

  private

    def set_farmer
      @farmer = Farmer.find(params[:id])
    end

    def farmer_params
      params.require(:farmer).permit(:name, :number_of_animals)
    end
end


