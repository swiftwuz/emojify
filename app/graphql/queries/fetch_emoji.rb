module Queries
  class FetchEmoji < Queries::BaseQuery
    type [Types::EmojifyType], null: false

    def resolve
      Emoji.all.order(created_at: :desc)
    end
  end
end
