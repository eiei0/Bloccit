require 'rails_helper'

 describe TopicsController do

  include TestFactories
  include Devise::TestHelpers

  let (:my_topic) { FactoryGirl.create(:topic)}
  let (:my_private_topic) { FactoryGirl.create(:topic, public: false) }

  describe '#index' do
    it "does not include private topics" do
      get :index
      expect(assigns(:topics)).not_to include(my_private_topic)
    end
  end

  describe '#new' do
    it "instantiates a new topic" do
      get :new
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe '#show' do
    before(:each) do
      get :show, {id: my_topic.id}
    end

    it "should render #show template" do
      expect(response).to render_template :show
    end

    it "assigns my_topic to @topic" do
      expect(assigns(:topic)).to eq(my_topic)
    end
  end

  describe '#edit' do
    before(:each) do
      get :edit, {id: my_topic.id}
    end

    it "returns redirect" do
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#create' do
    it "saves topic and redirects to the topic page" do
      @user = authenticated_user(role: "admin")
      sign_in @user

      topic_params = FactoryGirl.attributes_for(:topic, public: true)
      expect { post :create, topic: topic_params }.to change{ Topic.count }.by(1)
      expect(response).to redirect_to(Topic.last)
      expect(flash[:notice]).to be_present
    end

    it "fails to create a topic, displays flash error and redirects to #edit" do
      @user = authenticated_user
      sign_in @user
      binding.pry

      topic_params = FactoryGirl.attributes_for(:topic, public: false)
      expect { post :create, topic: topic_params }.to change{ Topic.count }.by(0)
      # expect(flash[:error]).to be_present
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    before(:each) do
      put :update, id: my_topic.id, topic: {
        name: "New Topic Name",
        description: "New Topic Description"
      }
    end

    it 'assigns my_topic to @topic' do
      expect(assigns(:topic)).to eq(my_topic)
    end

    it 'succesfully updates a topic' do
      @user = authenticated_user
      sign_in @user

      expect([my_topic.name, my_topic.description]).to eq(
        ["New Topic Name", "New Topic Description"]
      )
      expect(response).to redirect_to(:topic)
    end

    it 'fails to update a topic' do

    end
  end

  describe '#destroy' do
    before(:each) do
      delete :destroy, { id: my_topic.id }
    end

    it 'assigns my_topic to @topic' do
      expect(assigns(:topic)).to eq(my_topic)
    end

    it 'successfully destroys a topic' do
      # expect(flash[:notice]).to be_present
      expect(response).to render_template :show
    end
  end
 end
