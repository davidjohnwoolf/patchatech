require 'rails_helper'

RSpec.describe SiteController, :type => :controller do

  describe '#index' do
    it 'successfully renders site index' do
      get :index
      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

  describe '#about' do
    it 'successfully renders site index' do
      get :about
      expect(response).to be_success
      expect(response).to render_template('about')
    end
  end

  describe '#contact' do
    context 'when the user goes to the contact page' do
      it 'successfully renders site contact' do
        get :contact
        expect(response).to be_success
        expect(response).to render_template('contact')
      end
    end
    context 'when it is a post request' do
      # before do
      #   params = { user_name: "user_name", comment: "comment", user_email: "user_email" }
      #   @mailer = ContactMailer.contact_mailer(params)
      # end
      it 'successfully renders site index' do
        post :contact
        # expect(response).to be_success
        # expect { @mailer.contact_mailer }.to change { ActionMailer::Base.deliveries }.by(1)
        expect(response).to redirect_to root_path
      end
    end

  end

end
