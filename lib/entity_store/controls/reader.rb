module EntityStore
  module Controls
    module Reader
      def self.example
        Example.build
      end

      class Example
        include EventSource::Read
      end
    end
  end
end
