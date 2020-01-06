require 'rails_helper'

RSpec.describe 'Graphql', type: :request do
  let(:article) { create(:article) }

  describe 'POST "/graphql"' do
    context 'with valid params' do
      let(:params) do
        {
          query: "{
            article(name: \"#{article.name}\") {
              description
              name
              risk
            }
          }"
        }
      end

      it 'responds correctly' do
        post '/graphql.json', params: params, as: :json

        expect(json['data']['article']['name']).to eq(article.name)
      end
    end
  end
end
