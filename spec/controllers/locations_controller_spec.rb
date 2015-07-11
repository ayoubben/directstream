require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
  before :each do
    @Location = FactoryGirl.create(:location)
  end

  it "GET #show" do
    get :show, id: @Location
    expect(response).to render_template(:show)
  end
  it "GET index" do
    get :index
    expect(response).to render_template(:index)
  end
  it "GET new" do
    get :new
    expect(assigns(:location)).to be_a_new(Location)
  end

  it "create record" do
    post :create, location: FactoryGirl.attributes_for(:location) 
    response.should redirect_to(location_path(Location.last))
  end

end
