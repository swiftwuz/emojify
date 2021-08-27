module Types
  class MutationType < Types::BaseObject
    field :emojify_text, mutation: Mutations::EmojifyText
  end
end
