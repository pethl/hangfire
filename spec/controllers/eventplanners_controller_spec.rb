require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventplannersController do

  # This should return the minimal set of attributes required to create a valid
  # Eventplanner. As you add validations to Eventplanner, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventplannersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all eventplanners as @eventplanners" do
      eventplanner = Eventplanner.create! valid_attributes
      get :index, {}, valid_session
      assigns(:eventplanners).should eq([eventplanner])
    end
  end

  describe "GET show" do
    it "assigns the requested eventplanner as @eventplanner" do
      eventplanner = Eventplanner.create! valid_attributes
      get :show, {:id => eventplanner.to_param}, valid_session
      assigns(:eventplanner).should eq(eventplanner)
    end
  end

  describe "GET new" do
    it "assigns a new eventplanner as @eventplanner" do
      get :new, {}, valid_session
      assigns(:eventplanner).should be_a_new(Eventplanner)
    end
  end

  describe "GET edit" do
    it "assigns the requested eventplanner as @eventplanner" do
      eventplanner = Eventplanner.create! valid_attributes
      get :edit, {:id => eventplanner.to_param}, valid_session
      assigns(:eventplanner).should eq(eventplanner)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Eventplanner" do
        expect {
          post :create, {:eventplanner => valid_attributes}, valid_session
        }.to change(Eventplanner, :count).by(1)
      end

      it "assigns a newly created eventplanner as @eventplanner" do
        post :create, {:eventplanner => valid_attributes}, valid_session
        assigns(:eventplanner).should be_a(Eventplanner)
        assigns(:eventplanner).should be_persisted
      end

      it "redirects to the created eventplanner" do
        post :create, {:eventplanner => valid_attributes}, valid_session
        response.should redirect_to(Eventplanner.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved eventplanner as @eventplanner" do
        # Trigger the behavior that occurs when invalid params are submitted
        Eventplanner.any_instance.stub(:save).and_return(false)
        post :create, {:eventplanner => { "name" => "invalid value" }}, valid_session
        assigns(:eventplanner).should be_a_new(Eventplanner)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Eventplanner.any_instance.stub(:save).and_return(false)
        post :create, {:eventplanner => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested eventplanner" do
        eventplanner = Eventplanner.create! valid_attributes
        # Assuming there are no other eventplanners in the database, this
        # specifies that the Eventplanner created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Eventplanner.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => eventplanner.to_param, :eventplanner => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested eventplanner as @eventplanner" do
        eventplanner = Eventplanner.create! valid_attributes
        put :update, {:id => eventplanner.to_param, :eventplanner => valid_attributes}, valid_session
        assigns(:eventplanner).should eq(eventplanner)
      end

      it "redirects to the eventplanner" do
        eventplanner = Eventplanner.create! valid_attributes
        put :update, {:id => eventplanner.to_param, :eventplanner => valid_attributes}, valid_session
        response.should redirect_to(eventplanner)
      end
    end

    describe "with invalid params" do
      it "assigns the eventplanner as @eventplanner" do
        eventplanner = Eventplanner.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Eventplanner.any_instance.stub(:save).and_return(false)
        put :update, {:id => eventplanner.to_param, :eventplanner => { "name" => "invalid value" }}, valid_session
        assigns(:eventplanner).should eq(eventplanner)
      end

      it "re-renders the 'edit' template" do
        eventplanner = Eventplanner.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Eventplanner.any_instance.stub(:save).and_return(false)
        put :update, {:id => eventplanner.to_param, :eventplanner => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested eventplanner" do
      eventplanner = Eventplanner.create! valid_attributes
      expect {
        delete :destroy, {:id => eventplanner.to_param}, valid_session
      }.to change(Eventplanner, :count).by(-1)
    end

    it "redirects to the eventplanners list" do
      eventplanner = Eventplanner.create! valid_attributes
      delete :destroy, {:id => eventplanner.to_param}, valid_session
      response.should redirect_to(eventplanners_url)
    end
  end

end
