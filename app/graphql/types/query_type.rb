module Types
  class QueryType < Types::BaseObject
    field :articles, [ArticleType], null: true do
      description 'Index of Articles'
    end

    field :article, ArticleType, null: true do
      description 'Find an Article by ID.'
      argument :id, ID, required: true
    end

    def articles
      Article.all
    end

    def article(id:)
      Article.find(id)
    end
  end
end
