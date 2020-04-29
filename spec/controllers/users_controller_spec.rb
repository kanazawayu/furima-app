require 'rails_helper'

describe DeviseController, type: :controller do

  describe 'GET registrations#new' do
    it "registrations/new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

end