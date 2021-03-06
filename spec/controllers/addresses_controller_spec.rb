require 'spec_helper'
describe AddressesController do
  let(:user) { FactoryGirl.create :user }

  # This should return the minimal set of attributes required to create a valid
  # Address. As you add validations to Address, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { user_id: user.id, name: 'home', address1: 'address1', city: 'tucson', state: 'az', zip: 85704 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AddressesController. Be sure to keep this updated too.
  let(:valid_session) {
    sign_in user
    session.to_hash
  }

  describe "GET index" do
    it "assigns all addresses as @addresses" do
      address = Address.create! valid_attributes
      get :index, {user_id: user.id }, valid_session
      assigns(:addresses).should eq([address])
    end
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :show, {user_id: user.to_param, :id => address.to_param}, valid_session
      assigns(:address).should eq(address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address" do
      get :new, {user_id: user.to_param}, valid_session
      assigns(:address).should be_a_new(Address)
    end
  end

  describe "GET edit" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :edit, {user_id: user.to_param, :id => address.to_param}, valid_session
      assigns(:address).should eq(address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Address" do
        expect {
          post :create, {user_id: user.to_param, :address => valid_attributes}, valid_session
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do
        post :create, {user_id: user.to_param, :address => valid_attributes}, valid_session
        assigns(:address).should be_a(Address)
        assigns(:address).should be_persisted
      end

      it "redirects to the created address" do
        post :create, {user_id: user.to_param, :address => valid_attributes}, valid_session
        response.should redirect_to(user_address_path(user.to_param, Address.last.to_param))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved address as @address" do
        # Trigger the behavior that occurs when invalid params are submitted
        Address.any_instance.stub(:save).and_return(false)
        post :create, {user_id: user.to_param, :address => {  }}, valid_session
        assigns(:address).should be_a_new(Address)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Address.any_instance.stub(:save).and_return(false)
        post :create, {user_id: user.to_param, :address => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested address" do
        address = Address.create! valid_attributes
        # Assuming there are no other addresses in the database, this
        # specifies that the Address created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Address.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {user_id: user.to_param, :id => address.to_param, :address => { "these" => "params" }}, valid_session
      end

      it "assigns the requested address as @address" do
        address = Address.create! valid_attributes
        put :update, {user_id: user.to_param, :id => address.to_param, :address => valid_attributes}, valid_session
        assigns(:address).should eq(address)
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        put :update, {user_id: user.to_param, :id => address.to_param, :address => valid_attributes}, valid_session
        response.should redirect_to(user_address_path(user, address))
      end
    end

    describe "with invalid params" do
      it "assigns the address as @address" do
        address = Address.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Address.any_instance.stub(:save).and_return(false)
        put :update, {user_id: user.to_param, :id => address.to_param, :address => {  }}, valid_session
        assigns(:address).should eq(address)
      end

      it "re-renders the 'edit' template" do
        address = Address.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Address.any_instance.stub(:save).and_return(false)
        put :update, {user_id: user.to_param, :id => address.to_param, :address => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete :destroy, {user_id: user.to_param, :id => address.to_param}, valid_session
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the addresses list" do
      address = Address.create! valid_attributes
      delete :destroy, {user_id: user.to_param, :id => address.to_param}, valid_session
      response.should redirect_to(user_addresses_url(user))
    end
  end

end
