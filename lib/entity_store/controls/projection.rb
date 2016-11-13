module EntityStore
  module Controls
    module Projection
      class Example
        include EntityProjection

        apply Message::Example do |message|
          entity.sum ||= 0
          entity.sum += message.number
        end
      end
    end
  end
end
