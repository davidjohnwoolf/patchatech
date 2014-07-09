class TutorialsController < ApplicationController
  before_action :find_tutorial, only: [:update, :edit, :destroy, :show]

    def index
      @tutorials = Tutorial.all
    end

    def show
    end

    def new
      @tutorial = Tutorial.new
    end

    def create
      @tutorial = Tutorial.new(tutorial_params)
      @tutorial.user_id = current_user.id
      if @tutorial.save
        redirect_to tutorials_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @tutorial.update_attributes(tutorial_params)
        redirect_to tutorials_path
      else
        render :edit
      end
    end

    def destroy
      @tutorial.destroy
      redirect_to tutorials_path
    end

    private

    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :category, :user_id)
    end

    def find_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

end
