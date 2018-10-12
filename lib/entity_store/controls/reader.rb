module EntityStore
  module Controls
    module Reader
      def self.example
        Example.build
      end

      class Example
        include MessageStore::Read
      end

      module BatchSize
        def self.example
          11
        end
      end
    end
  end
end
