require 'rails_helper'

RSpec.describe SearchResultsController, :type => :controller do

    describe '#index', :focus do
      before do
        @user = create(:user)
        create_list(:tutorial, 3, user: @user)
        create(:tutorial, title: 'spec', user: @user)
        @search = "spec"
      end

      it 'searching "spec" and returning 1 result' do
        get :index, {q: @search}

        expect(response).to be_success
        expect(assigns(:results).count).to eq 1
        expect(response).to render_template('index')
      end

    end
end
