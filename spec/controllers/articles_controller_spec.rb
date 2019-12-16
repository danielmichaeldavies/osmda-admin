require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    let!(:articles) { create_list(:article, 3) }

    context 'when a valid user' do
      before { user_login }

      it { expect(get(:index)).to render_template(:index) }

      it 'has the correct articles' do
        get(:index)

        expect(assigns(:articles).ids).to eq(articles.pluck(:id))
      end
    end

    context 'when not a valid user' do
      it { expect(get(:index)).to redirect_to(login_path) }
    end
  end

  describe 'GET #new' do
    before { user_login }

    it { expect(get(:new)).to render_template(:new) }

    it 'instantiates an empty article' do
      get :new

      expect(assigns(:article).attributes).to eq(Article.new.attributes)
    end
  end

  describe 'POST #create' do
    before { user_login }

    let(:article) { build(:article, name: new_name) }
    let(:new_name) { 'Valid Name' }

    let(:create_request) { post(:create, params: { article: article.attributes }) }

    context 'with valid params' do
      it 'redirects to index route' do
        create_request

        expect(response).to redirect_to(articles_path)
      end

      it { expect { create_request }.to change(Article, :count).by(1) }
    end

    context 'with invalid params' do
      let(:new_name) { '' }

      it 'rerenders the new page' do
        create_request

        expect(response).to render_template(:new)
      end

      it { expect { create_request }.not_to change(Article, :count) }
    end
  end

  describe 'DELETE #destroy' do
    before { user_login }

    let!(:article) { create(:article) }

    let(:delete_request) { delete(:destroy, params: { id: article.id }, xhr: true) }

    it 'renders the destroy template' do
      delete_request

      expect(response).to render_template(:destroy)
    end

    it { expect { delete_request }.to change(Article, :count).by(-1) }
  end
end
