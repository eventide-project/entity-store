module EntityStore
  module Controls
    module EntityStore
      def self.example(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil)
        if category.nil? && entity_class.nil? && projection_class.nil? && reader_class.nil? && snapshot_class.nil? && snapshot_interval.nil?
          store_class = Example
        else
          store_class = example_class(category: category, entity_class: entity_class, projection_class: projection_class, reader_class: reader_class, snapshot_class: snapshot_class, snapshot_interval: snapshot_interval)
        end

        instance = store_class.build
        instance
      end

      def self.example_class(category: nil, entity_class: nil, projection_class: nil, reader_class: nil, snapshot_class: nil, snapshot_interval: nil)
        if category == :none
          category = nil
        else
          category ||= Controls::Category.example
        end

        if entity_class == :none
          entity_class = nil
        else
          entity_class ||= Controls::Entity::Example
        end

        if projection_class == :none
          projection_class = nil
        else
          projection_class ||= Controls::Projection::Example
        end

        if reader_class == :none
          reader_class = nil
        else
          reader_class ||= Controls::Reader::Example
        end

        interval = snapshot_interval

        Class.new do
          include ::EntityStore

          category category
          entity entity_class
          projection projection_class
          reader reader_class
          snapshot snapshot_class unless snapshot_class.nil?
          snapshot_interval interval unless interval.nil?
        end
      end

      module Category
        def self.example
          :some_category
        end
      end

      Example = self.example_class
    end
  end
end
