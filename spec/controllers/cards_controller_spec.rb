require 'rails_helper'

describe CardsController do
  let(:user) { create(:user) }
  let(:card) { create(:card) }

  describe '#index' do

    context 'ログインしている場合' do
      before do
        login user
      end


      it 'cards/index.html.haml に遷移すること' do
        get :index, params: { user_id: 1 }
        expect(response).to render_template :index
      end

      it 'cards/new.html.haml に遷移すること' do
        get :new, params: { user_id: 1 }
        expect(response).to render_template :new
      end



    end

    context 'ログインしていない場合' do
      before do
        get :index, params: { user_id: 1 }
      end

      it 'root_path に遷移すること' do
        expect(response).to redirect_to(root_path)
      end

    end
  end

end

describe CardsController do
  let(:card) { create(:card) }
  let(:user) { create(:user) }

  describe '#edit' do

    context 'ログインしている場合' do
      before do
        login user
      end

      it 'cards/edit.html.haml に遷移すること' do
        get :edit, params: { user_id: user.id, id: card.id  }
        expect(response).to render_template :edit
      end

    end
  end
end