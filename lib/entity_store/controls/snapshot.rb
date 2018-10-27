module EntityStore
  module Controls
    Snapshot = EntityCache::Controls::Store::External

    module Snapshot
      module Assurance
        Error = EntityCache::Store::External::Error

        module Assured
          class Example
            def self.assure(store); end
            def self.configure(*); end
          end
        end

        module NotAssured
          class Example
            def self.assure(store)
              raise Error
            end

            def self.configure(*); end
          end
        end

        module NotImplemented
          class Example
            def self.configure(*); end
          end
        end
      end
    end
  end
end
