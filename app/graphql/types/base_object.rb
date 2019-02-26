module Types
  class BaseObject < GraphQL::Schema::Object
    # GraphQL::Schema::Field.accepts_definition(:mask)
    # accepts_definition :permission_level
    field_class ::AuthorizedField
  end
end
