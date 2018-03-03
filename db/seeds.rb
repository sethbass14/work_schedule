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
bronson = User.create(name: "Bronson", company: mud)
curl = User.create(name: "Curl", company: mud)


bartender = Position.create(name: 'Bartender')
waiter = Position.create(name: 'Waiter')

seth.positions << [bartender, waiter]
brendan.positions << waiter
bronson.positions << bartender
curl.positions << waiter

week1_sched = Schedule.create(start_date: DateTime.now + 4, name: 'Week 1 Schedule', admin: james)


barAM = Shift.create(start_time: "06:45", end_time: "16:00", position_id: 1)
barPM = Shift.create(start_time: "16:00", end_time: "23:55", position_id: 1)

waiterAM = Shift.create(start_time: "06:45", end_time: "16:00", position_id: 2)
waiterPM = Shift.create(start_time: "16:00", end_time: "23:55", position_id: 2)

workday1 = week1_sched.workdays.first

employee_shift1 = EmployeeShift.create(employee: seth, shift: barAM, workday: workday1)
employee_shift3 = EmployeeShift.create(employee: bronson, shift: barPM, workday: workday1)
employee_shift2 = EmployeeShift.create(employee: brendan, shift: waiterAM, workday: workday1)
employee_shift4 = EmployeeShift.create(employee: curl, shift: waiterPM, workday: workday1)
