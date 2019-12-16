module Types
  class ArticleType < Types::BaseObject
    field :name, String, null: false
    field :description, String, null: true
    field :risk, String, null: false
  end
end
