module Exlibris
  module Aleph
    module TableParser
      class Collections < Base
        FILENAME = 'tab40.eng'

        def initialize(admin_library)
          super(admin_library, FILENAME)
        end

        def all
          rows.map do |row|
            sub_library = sub_libraries.find do |sub_library|
              sub_library.code == row.sub_library_code
            end
            unless sub_library.nil?
              Collection.new(row.code, row.display, sub_library)
            end
          end
        end

        private
        def sub_libraries
          @sub_libraries ||= Exlibris::Aleph::SubLibraries.instance
        end
      end
    end
  end
end
