# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Company.destroy_all
# User.destroy_all

mud = Company.create(name: "Mud")

james = User.create(name: 'James', company: mud, admin: true)
seth = User.create(name: 'Seth', company: mud)
brendan = User.create(name: 'Brendan', company: mud)

bartender = Position.create(name: 'Bartender')
waiter = Position.create(name: 'Waiter')

seth.positions << [bartender, waiter]
brendan.positions << waiter

week1_sched = Schedule.create(start_date: DateTime.now + 4, name: 'Week 1 Schedule', admin: james)
