module Types
  module Input
    class EmojifyInputType < Types::BaseInputObject
      argument :body, String, required: true
    end
  end
end
