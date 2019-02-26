module Types
  class Post < Types::BaseObject
    graphql_name 'Post'
    description 'Resembles a Post Object Type'

    field :id, ID, null: false
    field :name, String, null: false, description: 'Name.', view: :admin
    field :live, Boolean, null: false, description: 'Live?'
    field :description, String, null: true, description: 'Description.'
  end
end
