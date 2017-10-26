class MilksController < ApplicationController
  before_action :authenticate_user!


def index
	@milks = Milk.all

	render json: @milks
end
def show
    render json: @milk
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @milk = Milk.new(task_params)

    if @milk.save
      render json: @milk, status: :created, location: @milk
    else
      render json: @milk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @milk.update(task_params)
      head :no_content
    else
      render json: @milk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @milk.destroy

    head :no_content
  end

  private

    def set_milk
      @milk = Milk.find(params[:id])
    end

    def milk_params
      params.require(:milk).permit(:farmer_id, :quantity, :quality, :status)
    end
end