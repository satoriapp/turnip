require 'turnip/node/base'

module Turnip
  module Node
    #
    # @note Location metadata generated by Gherkin
    #
    #     {
    #       type: :Tag,
    #       location: { line: 10, column: 3 },
    #       name: '@tag'
    #     }
    #
    class Tag < Base
      def name
        @name ||= @raw[:name].gsub(/^@/, '')
      end
    end

    module HasTags
      #
      # @return [Array] Array of Tag
      #
      def tags
        @tags ||= @raw[:tags].map do |tag|
          Tag.new(tag)
        end
      end

      #
      # Convert for hash to be used in RSpec
      #
      # @return  [Hash]
      #
      def metadata_hash
        Hash[tags.map { |t| [t.name.to_sym, true] }]
      end
    end
  end
end
