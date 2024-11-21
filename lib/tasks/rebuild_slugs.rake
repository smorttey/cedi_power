namespace :slugs do
    desc "Rebuild slugs for models"
    task rebuild: :environment do
      [Category, Item, Market].each do |model|
        puts "Rebuilding slugs for #{model}..."
        model.find_each do |record|
          record.slug = nil
          record.save!
        end
      end
      puts "Slugs rebuilt successfully!"
    end
  end
  