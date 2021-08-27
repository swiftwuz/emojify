module Mutations
  class EmojifyText < Mutations::BaseMutation
    argument :params, Types::Input::EmojifyInputType, required: true

    field :emoji, Types::EmojifyType, null: false

    def resolve(params:)
      emojify_params = Hash params
      begin
        emojify = Emoji.create!(emojify_params)

        {
          emojify: emojify
        }

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                    " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
