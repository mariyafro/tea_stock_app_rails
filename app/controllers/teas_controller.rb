class TeasController < ApplicationController
  before_action :set_tea, only: %i[show edit update destroy]

  def index
    @teas = Tea.all
  end

  def show
  end

  def new
    @tea = Tea.new
  end

  def create
    @tea = Tea.new(tea_params)
    if @tea.save
      redirect_to @tea
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tea.update(tea_params)
      redurect_to @tea
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tea.destroy
    redirect_to teas_path
  end

  private
    def set_tea
      @tea = Tea.find(params[:id])
    end

    def tea_params
      params.expect(tea: [ :name ])
    end
end
