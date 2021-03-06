module Exlibris
  module Aleph
    module API
      module Client
        class Record < Base
          attr_reader :id

          def initialize(id, query={})
            super(query)
            @id = id
          end

          protected
          def path
            @path ||= "#{super}/record/#{id}"
          end
        end
      end
    end
  end
end
