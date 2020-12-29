require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #new" do
    before (:each) do
      get new_user_path
    end
    it "レスポンスコードが200であること" do
      expect(response).to have_http_status(:ok)
    end
    it "newテンプレートをレンダリングすること" do
      expect(response).to render_template :new
    end
    it "新しいuserオブジェクトがビューに渡されること" do
      expect(assigns(:user)).to be_a_new User
    end
  end
  
  describe "POST #create" do
    # before(:each) do 
    #   @referer = "http://localhost:3000/"
    #   request.env["HTTP_REFERER"] = @referer
    # end

    context "正しいユーザー情報が渡って来た場合" do
      let(:params) do
        { user: {
            name: "user",
            password: "password",
            password_confirmation: "password"
          }
        }
      end
      it "ユーザーが一人増えていること" do
        expect { post users_path, params: params }.to change(User, :count).by(1) 
      end
      it "マイページにリダイレクトされること" do
        expect(post users_path, params: params).to redirect_to(mypage_path)
      end
    end

    # context "パラメータに正しいユーザ名、確認パスワードが含まれていない場合" do
    #   before do
    #     post(users_path, params: {
    #       user: {
    #         name: "ユーザー1",
    #         password: "password",
    #         password_confirmation: "invalid_password"
    #       }
    #     })
    #   end
    #   # it "リファラーにリダイレクトされること" do
    #   #   expect(response).to redirect_to(@referer)
    #   # end
    #   it "ユーザー名のエラーメッセージが含まれていること" do
    #     expect(flash[:error_messages]).to include "ユーザー名は小文字英数字で入力してください"
    #   end
    # end
  end
end
