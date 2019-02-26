module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"

    def test_field
      "Hello World!"
    end

    field :posts, [Types::Post], null: true do
      description 'Get a list of posts.'
    end

    def posts
      ::Post.all
    end

    field :post, Types::Post, null: true do
      description 'Get a post.'
    end

    def post
      ::Post.first
    end
  end
end
