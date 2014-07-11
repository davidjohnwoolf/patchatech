require 'rails_helper'

RSpec.describe UserController, :type => :controller do

  describe '#show' do

    before do
      @user = create(:user)
    end

    context 'user is signed in' do
      before do
        sign_in @user
      end

      it 'displays a user profile view' do
        get :show, id: @user.id
        expect(response).to be_success
        expect(response).to render_template('show')
      end
    end

    context 'user is not signed in' do
      it 'redirects to sign_in' do
        get :show, id: @user.id
        expect(response).to be_redirect
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

end
