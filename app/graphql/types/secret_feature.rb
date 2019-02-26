class Types::SecretFeature < Types::BaseObject
  def self.visible?(context)
    # only show it to users with the secret_feature enabled
    puts context[:current_user].inspect
    super && context[:current_user].admin == true
  end
end
