class SiteController < ApplicationController
  def index
    @tutorials = Tutorial.limit(8).order('created_at desc')
  end

  def about

  end

  def contact

  end

end
