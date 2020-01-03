module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :risk, String, null: false
  end
end
