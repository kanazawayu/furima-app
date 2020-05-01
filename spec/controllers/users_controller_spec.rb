require 'rails_helper'

describe UsersController, type: :controller do

  describe 'GET users#new' do
    it "users/new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  # describe 'GET users#show' do
  #   login(user)
  #   it "users/show.html.hamlに遷移すること" do
  #     user = create(:user)
  #     get :show, params: { id: 1 }
  #     expect(response).to render_template :show
  #   end
  # end

end

describe UsersController do
  let(:user) { create(:user) }

  describe '#show' do

    context 'ログインしている場合' do
      before do
        login user
        get :show, params: { id: 1 }
        
      end

      it 'users/show.html.haml に遷移すること' do
        expect(response).to render_template :show
      end

    end

    context 'ログインしていない場合' do
      before do
        get :show, params: { id: 1 }
      end

      it 'root_path に遷移すること' do
        expect(response).to redirect_to()
      end

    end
  end
end