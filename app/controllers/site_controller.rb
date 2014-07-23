class SiteController < ApplicationController
  
  def index
    @tutorials = Tutorial.limit(8).order('created_at desc')
  end

  def about

  end

  def contact
    if request.post?
      ContactMailer.contact_mailer(params).deliver
      redirect_to root_path
    end
  end

end
