class SearchResultsController < ApplicationController

  def index
    @results = Tutorial.search(params[:q])
  end
end
