  module EntityStore
    module Controls
      module Message
        def self.example
          first
        end

        def self.first
          Example.build :number => 1
        end

        def self.second
          Example.build :number => 11
        end

        class Example
          include Messaging::Message

          attribute :number
        end
      end
    end
  end
