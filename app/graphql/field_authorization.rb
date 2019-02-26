class FieldAuthorization
  def instrument(_type, field)
    return field if field.metadata[:access_permission].blank?

    resolve_proc = authorization_proc(field)

    # Return a copy of `field`, with a new resolve proc
    field.redefine do
      resolve(resolve_proc)
    end
  end

private

  def authorization_proc(field)
    permission = field.metadata[:access_permission]
    original_resolve_proc = field.resolve_proc

    ->(obj, args, ctx) {
      resolved = original_resolve_proc.call(obj, args, ctx)
      puts resolved.inspect

      # policy = permission[:policy_class].new(ctx[:current_user], resolved)

      raise GraphQL::ExecutionError, :forbidden unless ctx[:current_user].admin?

      resolved
    }
  end
end
