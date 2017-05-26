module EntityStore
  module Controls
    module Reader
      def self.example
        Example.build
      end

      class Example
        include MessageStore::Read
      end
    end
  end
end
