# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if User.find_by_email('test@example.com')
test_user = User.create!(email: 'test@example.com', password: 'testuser')
sample_user = User.create!(email: 'sample@example.com', password: 'sampleuser')

dashboard = test_user.dashboards.create!(title: 'First Dashboard')

to_do_list = dashboard.lists.create!(title: 'To Do', sort_order: 1000)
in_progress_list = dashboard.lists.create!(title: 'In Progress', sort_order: 2000)
done_list = dashboard.lists.create!(title: 'Done', sort_order: 3000)

to_do_list.cards.create(title:'Setup environment', description: 'Install Docker for desktop', sort_order: 1000, assignee: sample_user)
to_do_list.cards.create(title:'Setup the docker image', description: 'Install rails/react', sort_order: 2000)
to_do_list.cards.create(title:'Learn Ruby On Rails', description: 'Learn the basics of the web application dev using RoR framework', sort_order: 3000)
to_do_list.cards.create(title:'Learn ReactJS', description: 'Learn the basics of the front-end development using ReactJS', sort_order: 4000)
