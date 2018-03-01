# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# GigType.destroy_all
unless GigType.all.any?
  gig_types = [
    {icon: 'laptop', name: 'Web design', description: 'Build or update your website', color: 'primary' },
    {icon: 'chart-line', name: 'SEO', description: 'Help optimise your site for search engines', color: 'warning' },
    {icon: 'share-square', name: 'Digital marketing', description: 'Help you conquer the social media landscape', color: 'danger' },
    {icon: 'paint-brush', name: 'Graphic design', description: 'Create a logo or style guide', color: 'info' }
  ]

  gig_types.each do |gt|
    type = GigType.create(icon: gt[:icon], name: gt[:name], description: gt[:description], color: gt[:color])
    puts "Gig type created: " + type.name
  end
end
