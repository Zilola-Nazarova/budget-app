require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let(:valid_attributes) { { 'user' => @user, 'name' => 'Food', 'icon' => 'missing_avatar.png' } }
  let(:group) { Group.create! valid_attributes }
  let(:purchase) { Purchase.create(name: 'Apples', amount: 5, author: @user) }
  let(:groupp_urchase) { GroupPurchase.create(group: group, purchase: purchase) }

  before :each do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: 'topsecret')
    @user.confirm
    login(@user)
  end

  context "GET /index" do
    before :each do
      get group_purchases_url(group)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:index)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>transactions</h1>')
    end
  end

  context "GET /show" do
    before :each do
      get group_purchase_url(group, purchase)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:show)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>details</h1>')
      expect(response.body).to include('<span class="name">Apples</span>')
    end
  end

  context "GET /new" do
    before :each do
      get new_group_purchase_url(group)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:new)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>new transaction</h1>')
    end
  end

  context "GET /edit" do
    before :each do
      get edit_group_purchase_url(group, purchase)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'renders the right view file' do
      expect(response).to render_template(:edit)
    end

    it 'renders the right placeholder' do
      expect(response.body).to include('<h1>edit transaction</h1>')
    end
  end

  def login(user)
    post new_user_session_path, params: {
      user: {
        email: user.email, password: user.password
      }
    }
    follow_redirect!
  end
end
