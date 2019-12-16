module Types
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField

    field :id, ID, null: false
  end
end
