require 'rails_helper'

RSpec.describe TutorialsController, :type => :controller do

  describe '#index' do
    before do
      @tutorials = create_list(:tutorial, 3)
    end
    it 'displays a collection of tutorials' do
      get :index
      expect(response).to be_success
      expect(assigns(:tutorials).count).to eq 3 #grab an instance variable named tutorials and the value of that
      expect(response).to render_template('index') #make sure its rendering the right template that being index instead of say rendering the new tempate on the index page
                                               #if you go to render a new template and it fails to create it will go to the create page and load the new template causeing an error even thoug hits not necessarily the template
    end
  end

  describe '#show' do
    before do
      @tutorial = create(:tutorial, title: 'Video1')
    end
    it 'displays a single tutorial' do
      get :show, id: @tutorial.id
      expect(response).to be_success
      expect(assigns(:tutorial).title).to eq 'Video1'
      expect(response).to render_template('show')
    end
  end

  describe '#new' do
    it 'sets up a new tutorial instance' do
      get :new
      expect(response).to be_success
      expect(assigns(:tutorial)).to be_new_record
      expect(response).to render_template('new')
    end
  end

  describe '#create' do
      context 'when saving a proper record' do
        it 'creates a new tutorial and saves it to the db' do
          expect {
          post :create, tutorial: {title: 'a new tutorial'}
        }.to change(Tutorial, :count).by(1) #checks the count of tutorials before and after and compares after to see if it changed by 1

        end
      end
      context 'when the record fails to save' do
        it 'renders the new template and does not save to the db' do
          post :create, tutorial: {title: nil}
          expect(response).to render_template("new")
          expect(Tutorial.count).to eq 0
        end
      end
  end

  describe '#edit' do
    before do
      @tutorials = create(:tutorial)
    end
    it 'displays the tutorial I want to edit' do
      get :edit, id: @tutorial.id
      expect(response).to be_success
      expect(assigns(:tutorial).id).to eq @tutorial.id
      expect(response).to render_template('edit')
    end
  end

  describe '#update' do
      before do
        @tutorial = create(:tutorial, title: 'new')
      end
    context 'when updateing a proper record' do
      it 'updates a tutorial and saves it to the db' do
        put :update, id: @tutorial.id, tutorial: {title: "updated"}
        expect(@tutorial.reload.title).to eq 'updated'
        expect(response).to be_redirect
        expect(response).to redirect_to tutorials_path
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
      @tutorial = create(:tutorial)
    end
    it 'removes the tutorial from the database' do
      expect{
        delete :destroy, id: @tutorial.id
      }.to change(Tutorial, :count).from(1).to(0)
      expect(response).to be_redirect
      expect(response).to redirect_to tutorials_path
    end
  end
end
