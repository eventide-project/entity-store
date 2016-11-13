module EntityStore
  module Controls
    module Version
      def self.example
        Current.example
      end

      module NotCached
        def self.example
          nil
        end
      end

      module Cached
        def self.example
          0
        end
      end

      module Current
        def self.example
          1
        end
      end
    end
  end
end
