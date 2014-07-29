class TutorialsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_tutorial, only: [:update, :edit, :destroy, :show]
  before_action :check_tutorial_user, only: [:edit, :update, :destroy]


    def index
      @tutorials = Tutorial.all.page(params[:page]).per(12)
    end

    def show
      @user = User.find(@tutorial.user_id)
      @duration = @tutorial
    end

    def new
      @tutorial = Tutorial.new
    end

    def create
      @tutorial = Tutorial.new(tutorial_params)
      @tutorial.user_id = current_user.id
      @tutorial.title.capitalize!
      if @tutorial.save
        redirect_to user_path(current_user.id)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @tutorial.update(tutorial_params)
        redirect_to user_path(current_user.id)
      else
        render :edit
      end
    end

    def destroy
      @tutorial.destroy
      redirect_to user_path(current_user.id)
    end

    # --------- Start Rating Methods --------- #

    def rate_up
      @tutorial = Tutorial.find(params[:tutorial_id])
      @user = User.find(@tutorial.user_id)
      @tutorial.rating += 1
      @tutorial.user_rated_will_change!
      @tutorial.user_rated << current_user.id.to_s
      @tutorial.save
      redirect_to tutorial_path(@tutorial.id)
    end

    def rate_down
      @tutorial = Tutorial.find(params[:tutorial_id])
      @user = User.find(@tutorial.user_id)
      @tutorial.rating -= 1
      @tutorial.user_rated_will_change!
      @tutorial.user_rated << current_user.id.to_s
      @tutorial.save
      redirect_to tutorial_path(@tutorial.id)
    end
    # --------- End Rating Methods --------- #

    private

    def check_tutorial_user
      unless current_user && (current_user.id == @tutorial.user_id)
        not_found
      end
    end

    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :category, :user_id, :video, :cover_photo, :rating, :user_rated)
    end

    def find_tutorial
      @tutorial = Tutorial.find(params[:id])
    end
end
