module Types
  class QueryType < Types::BaseObject
    field :article, ArticleType, null: true do
      description 'Find an Article by ID.'
      argument :id, ID, required: true
    end

    field :articles, [ArticleType], null: true do
      description 'Index of Articles'
    end

    private

    def articles
      Article.all
    end

    def article(id:)
      Article.find(id)
    end
  end
end
