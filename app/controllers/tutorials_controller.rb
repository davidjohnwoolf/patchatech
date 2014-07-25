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
      if @tutorial.valid?
        movie = FFMPEG::Movie.new(@tutorial.video.file.file)
        @tutorial.video_duration = Time.at(movie.duration).strftime('%M:%S')
        if @tutorial.save
          redirect_to user_path(current_user.id)
        end
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @tutorial.update_attributes(tutorial_params)
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
    def add_user_to_user_rated
      @tutorial.user_rated << current_user.id
    end

    def rate_up
      @tutorial.rating += 1
    end

    def rate_down
      @tutorial.rating += 1
    end
    # --------- End Rating Methods --------- #

    def add_user_to_user_rated
      @tutorial.user_rated << current_user.id
    end

    def rate_up
      @tutorial.rating += 1
    end

    def rate_down
      @tutorial.rating += 1
    end

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
