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

  # describe '#create' do
  #   let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }

  #   context 'ログインしている場合' do
  #     before do
  #       login user
  #     end

  #     context '保存に成功した場合' do
  #       subject {
  #         post :create,
  #         params: params
  #       }

  #       it 'messageを保存すること' do
  #         expect{ subject }.to change(Message, :count).by(1)
  #       end

  #       it 'group_messages_pathへリダイレクトすること' do
  #         subject
  #         expect(response).to redirect_to(group_messages_path(group))
  #       end
  #     end

  #     context '保存に失敗した場合' do
  #       let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, content: nil, image: nil) } }

  #       subject {
  #         post :create,
  #         params: invalid_params
  #       }

  #       it 'messageを保存しないこと' do
  #         expect{ subject }.not_to change(Message, :count)
  #       end

  #       it 'index.html.hamlに遷移すること' do
  #         subject
  #         expect(response).to render_template :index
  #       end
  #     end
  #   end

  #   context 'ログインしていない場合' do

  #     it 'new_user_session_pathにリダイレクトすること' do
  #       post :create, params: params
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  # end
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