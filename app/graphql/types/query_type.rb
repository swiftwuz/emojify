module Types
  class QueryType < Types::BaseObject
    field :fetch_emoji, resolver: Queries::FetchEmoji
  end
end
