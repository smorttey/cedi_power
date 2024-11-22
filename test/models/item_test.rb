require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "should not save item without name" do
    item = Item.new(measurement: "kg", category: categories(:electronics))
    assert_not item.save
  end

  test "should not save item without measurement" do
    item = Item.new(name: "Test Item", category: categories(:electronics))
    assert_not item.save
  end

  test "should generate different slugs for same item with different conditions" do
    category = categories(:electronics)

    item1 = Item.create!(
      name: "LG TV",
      measurement: "Brand New",
      category: category,
      description: "Test"
    )

    item2 = Item.create!(
      name: "LG TV",
      measurement: "Used",
      category: category,
      description: "Test"
    )

    assert_not_equal item1.slug, item2.slug
  end

  test "should generate simple slug for non-electronic items" do
    category = categories(:fruits)

    item = Item.create!(
      name: "Fresh Tomatoes",
      measurement: "kg",
      category: category,
      description: "Test"
    )

    assert_match /^fresh-tomatoes(-[a-f0-9-]+)?$/, item.slug
  end
end
