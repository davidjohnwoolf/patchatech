require 'rails_helper'


RSpec.describe TutorialsController, :type => :controller do

  describe '#index' do
    before do
      @user = create(:user)
      @tutorials = create_list(:tutorial, 3, user: @user)
    end
    it 'displays a collection of tutorials' do
      get :index
      expect(response).to be_success
      expect(assigns(:tutorials).count).to eq 3
      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    before do
      @user = create(:user)
      @tutorial = create(:tutorial, title: 'Video1', user: @user)
    end
    it 'displays a single tutorial' do
      get :show, id: @tutorial.id
      expect(response).to be_success
      expect(assigns(:tutorial).title).to eq 'Video1'
      expect(response).to render_template('show')
    end
  end

  describe '#new' do
    before do
      @user = create(:user)
    end
    context 'user is signed in' do
      before do
        sign_in @user
      end
      it 'sets up a new tutorial instance' do
        get :new
        expect(response).to be_success
        expect(assigns(:tutorial)).to be_new_record
        expect(response).to render_template('new')
      end
    end
    context 'user is not signed in' do
      it 'redirects to sign_in' do
        get :new
        expect(response).to be_redirect
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#create' do
    before do
      @user = create(:user)
      sign_in @user
    end
    context 'when saving a proper record' do
      it 'creates a new tutorial and saves it to the db' do
        expect {
        post :create, tutorial: {id: 1, title: 'test', description: 'asdf', video: 'public/uploads/video/5/Responsive_Web_Design_with_Foundation_-_1.1._Introduction.mp4'}
      }.to change(Tutorial, :count).by(1)
      end
    end

    context 'when the record fails to save' do
      it 'renders the new template and does not save to the db' do
        post :create, tutorial: { title: 'test', description: 'asdf', category: nil, video: nil }
        expect(response).to render_template("new")
        expect(Tutorial.count).to eq 0
      end
    end
  end

  describe '#edit' do
    before do
      @user = create(:user)
      @tutorial = create(:tutorial, user: @user)
    end
    context 'when user who created the tutorial is signed in' do
      before do
        sign_in @user
      end
      it 'displays the tutorial selected to edit' do
        get :edit, id: @tutorial.id
        expect(response).to be_success
        expect(assigns(:tutorial).id).to eq @tutorial.id
        expect(response).to render_template('edit')
      end
    end
    context 'when the tutorial doesnt belong to current user' do
      it 'raise routing error not found' do
        expect {
          get :edit, id: @tutorial.id
        }.to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe '#update' do
      before do
        @user = create(:user)
        sign_in @user
        @tutorial = create(:tutorial, title: 'new', user: @user)
      end
    context 'when updating a proper record' do
      it 'updates a tutorial and saves it to the db' do
        put :update, id: @tutorial.id, tutorial: {title: "updated"}
        expect(@tutorial.reload.title).to eq 'updated'
        expect(response).to be_redirect
        expect(response).to redirect_to user_path(@user.id)
      end
    end
    context 'when the update failed' do
      it 'fails to update the title from new to nil and renders the edit template' do
        put :update, id: @tutorial.id, tutorial: {title: nil}
        expect(@tutorial.reload.title).to_not be_nil
        expect(response).to render_template("edit")
      end
    end
  end

  describe '#destroy' do
    before do
      @user = create(:user)
      sign_in @user
      @tutorial = create(:tutorial, user: @user)
    end
    it 'removes the tutorial from the database' do
      expect{
        delete :destroy, id: @tutorial.id
      }.to change(Tutorial, :count).from(1).to(0)
      expect(response).to be_redirect
      expect(response).to redirect_to user_path(@user.id)
    end
  end
end
