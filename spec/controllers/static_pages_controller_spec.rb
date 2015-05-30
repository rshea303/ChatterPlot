require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  it "should get home" do
    get :home

    expect(response).to render_template(:home)
  end

end
