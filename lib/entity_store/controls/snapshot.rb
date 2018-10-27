module EntityStore
  module Controls
    Snapshot = EntityCache::Controls::Store::External

    class ::EntityCache
      module Controls
        module Store
          module External
            class Example
              def self.assure(*); end
            end
          end
        end
      end
    end

    module Snapshot
      module Assurance
        Error = ::EntityCache::Store::External::Error

        module Assured
          class Example
            def self.assure(*); end
            def self.configure(*); end
          end
        end

        module NotAssured
          class Example
            def self.assure(*)
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
