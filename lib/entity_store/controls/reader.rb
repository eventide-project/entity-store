module EntityStore
  module Controls
    module Reader
      def self.example
        Example.build
      end

      class Example
        include MessageStore::Read

        module Defaults
          def self.batch_size
            Reader::BatchSize.example
          end
        end
      end

      module BatchSize
        def self.example
          11
        end
      end
    end
  end
end
