require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/new" do
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

end
