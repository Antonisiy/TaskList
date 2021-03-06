# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
@config = HashWithIndifferentAccess.new(YAML.load(File.read((seed_file))))
	@config[:projects].each do |values|
		#puts values.size
			@title = values[:title]
			@todos = values[:todos]
			@projects = Project.create! title: @title
			@temp_todo = Todo.create!(@todos)
			@projects.todos = @temp_todo
	end



#seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
#config = HashWithIndifferentAccess.new(YAML::load_file(seed_file))
#Project.create(config["projects"])
#Todo.create(config["todos"])
