module Mutations
  class EmojifyText < Mutations::BaseMutation
    include HTTParty
    argument :sentence, String, required: true

    ##field :emoji, String, null: false
    # field :emoji, Types::EmojifyType, null: false
    type String

    def resolve(sentence:)
      begin
        response = HTTParty.post('http://localhost:5000/emojify', headers: {
          'Content-Type' => 'application/json'}, body: { text: sentence }.to_json)
          data = JSON.parse(response.body)
          data['result']
          
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                    " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
