module Types
  class QueryType < Types::BaseObject
    field :articles, [ArticleType], null: true do
      description 'Index of Articles'
    end

    field :article, ArticleType, null: true do
      description 'Find an Article by Name.'
      argument :name, String, required: true
    end

    def articles
      Article.all
    end

    def article(name:)
      Article.find_by(name: name)
    end
  end
end
