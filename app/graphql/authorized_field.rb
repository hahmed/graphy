class AuthorizedField < GraphQL::Schema::Field
  # Override #initialize to take a new argument:
  def initialize(*args, view: :all, **kwargs, &block)
    @view = view
    # Pass on the default args:
    super(*args, **kwargs, &block)
  end

  def to_graphql
    field_defn = super # Returns a GraphQL::Field
    field_defn.metadata[:view] = @view
    puts field_defn.inspect
    field_defn
  end
end
