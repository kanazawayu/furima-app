require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET items#new' do
    it "items/new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:category) {create(:category)}

    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存に成功した場合' do
        subject {
          post :create,
          params: { item: { user_id:        user.id, 
                            name:           "妖怪ウォッチ",
                            info:           "ゲーム",
                            status:         "clean",
                            category_id:    category.id,
                            switch:         "draft",
                            value:          500,
                            sold:           "sale",
                            images_attributes: build(:image),
                            shipment_attributes: build(:shipment)
                            
                    }}
                 }

        it 'itemを保存すること' do
          expect{ subject }.to change(Item, :count).by(1)
        end

        it 'root_pathへリダイレクトすること' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context '保存に失敗した場合' do

        subject {
          post :create,
          params: { item: { user_id:        user.id, 
                            name:           nil,
                            info:           "ゲーム",
                            status:         "clean",
                            category_id:    category.id,
                            switch:         "draft",
                            value:          500,
                            sold:           "sale",
                            images_attributes: build(:image),
                            shipment_attributes: build(:shipment)
          
                    }}
                  }

        it 'itemを保存しないこと' do
          expect{ subject }.not_to change(Item, :count)
        end

        it 'new.html.hamlに遷移すること' do
          subject
          expect(response).to render_template :new
        end
      end
    end

    # context 'ログインしていない場合' do

    #   it 'root_pathにリダイレクトすること' do
    #     subject {
    #       post :create,
    #       params: { item: { user_id:        user.id, 
    #                                      name:           "妖怪ウォッチ",
    #                                      info:           "ゲーム",
    #                                      status:         "clean",
    #                                      category_id:    category.id,
    #                                      switch:         "draft",
    #                                      value:          500,
    #                                      sold:           "sale",
    #                                      images_attributes: build(:image),
    #                                      shipment_attributes: build(:shipment)
    #                              }}
    #                 }
    #     expect(response).to redirect_to(root_path)
    #   end
    # end
  end

  

end

# describe itemsController do
#   let(:item) { create(:item) }

#   describe '#show' do

#     context 'ログインしている場合' do
#       before do
#         login item
#         get :show, params: { id: 1 }
        
#       end

#       it 'items/show.html.haml に遷移すること' do
#         expect(response).to render_template :show
#       end

#     end

#     context 'ログインしていない場合' do
#       before do
#         get :show, params: { id: 1 }
#       end

#       it 'root_path に遷移すること' do
#         expect(response).to redirect_to(root_path)
#       end

#     end
#   end
# end