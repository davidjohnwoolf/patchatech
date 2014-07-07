require 'rails_helper'

RSpec.describe SiteController, :type => :controller do

  describe '#index' do
    it 'successfully renders site index' do
      get :index
      expect(response).to be_success
      expect(response).to render_template('index')
    end
  end

end
