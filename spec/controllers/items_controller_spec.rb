require 'rails_helper'
describe ItemsController, type: :controller do
  describe '#edit' do
  
      let(:user) { create(:user) }
      # let(:category) {create(:category)}
      let(:image) {create(:image)}
      let(:shipment) {create(:shipment)}
      let(:item) {create(:item,user_id: user.id)} 
      describe 'GET #edit' do
        before do
          login user
        end
          it "@itemに正しい値が入っていること" do
            # item = create(:item)
            # item = create(:item, user_id: user.id, name: "妖怪ウォッチ", info: "ゲーム", status: "clean", category_id: category.id, switch: "draft", value: 500, sold: "sale", images_attributes: build(:image), shipment_attributes: build(:shipment))
            # item = (:item, user_id: user.id, name: "妖怪ウォッチ", info: "ゲーム", status: "clean", category_id: category.id, switch: "draft", value: 500, sold: "sale", images_attributes: build(:image), shipment_attributes: build(:shipment))
            get :edit, params: { id: item }
            expect(assigns(:item)).to eq item
            # expect(assigns(:item)).to match(item)
            # expect(response).to render_template :edit
          end

          it "edit.html.erbに遷移すること" do

            # subject {
              get :edit, 
              params: {id: item}
              # params: { item:  {            user_id:        user.id, 
              #                               name:           "妖怪ウォッチ",
              #                               info:           "ゲーム",
              #                               status:         "clean",
              #                               category_id:    category.id,
              #                               switch:         "draft",
              #                               value:          500,
              #                               sold:           "sale",
              #                               images:        [image],
              #                               shipment:      shipment
          
            #   # }}
            #   puts "aaaaaaaaaaaa"
            # }
            expect(response).to render_template :edit
    end
  end
end



  # let(:user) { create(:user) }

  # describe 'GET items#new' do
  #   it "items/new.html.hamlに遷移すること" do
  #     get :new
  #     expect(response).to render_template :new
  #   end
  # end

  # describe '#create' do
  #   let(:category) {create(:category)}

  #   context 'ログインしている場合' do
  #     before do
  #       login user
  #     end

  #     context '保存に成功した場合' do
  #       subject {
  #         post :create,
  #         params: { item: { user_id:        user.id, 
  #                           name:           "妖怪ウォッチ",
  #                           info:           "ゲーム",
  #                           status:         "clean",
  #                           category_id:    category.id,
  #                           switch:         "draft",
  #                           value:          500,
  #                           sold:           "sale",
  #                           images_attributes: build(:image),
  #                           shipment_attributes: build(:shipment)
                            
  #                   }}
  #                }

  #       it 'itemを保存すること' do
  #         expect{ subject }.to change(Item, :count).by(1)
  #       end

  #       it 'root_pathへリダイレクトすること' do
  #         subject
  #         expect(response).to redirect_to(root_path)
  #       end
  #     end

  #     context '保存に失敗した場合' do

  #       subject {
  #         post :create,
          # params: { item: { user_id:        user.id, 
          #                   name:           nil,
          #                   info:           "ゲーム",
          #                   status:         "clean",
          #                   category_id:    category.id,
          #                   switch:         "draft",
          #                   value:          500,
          #                   sold:           "sale",
          #                   images_attributes: build(:image),
          #                   shipment_attributes: build(:shipment)
          
  #                   }}
  #                 }

  #       it 'itemを保存しないこと' do
  #         expect{ subject }.not_to change(Item, :count)
  #       end

  #       it 'new.html.hamlに遷移すること' do
  #         subject
  #         expect(response).to render_template :new
  #       end
  #     end
  #   end

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
  # end

  
  # let(:item) { edit(:item) }

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