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
end
