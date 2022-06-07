# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: '佐藤一郎', employee_id: '10001', email: 'test1@yahoo.co.jp', password: 'test111', password_confirmation: 'test111', role: 2)
User.create(name: '田中二郎', employee_id: '10002', email: 'test2@yahoo.co.jp', password: 'test222', password_confirmation: 'test222', role: 1)
User.create(name: '高橋三郎', employee_id: '10003', email: 'test3@yahoo.co.jp', password: 'test333', password_confirmation: 'test333', role: 0)
User.create(name: '渡辺四郎', employee_id: '10004', email: 'test4@yahoo.co.jp', password: 'test444', password_confirmation: 'test444', role: 0)
User.create(name: '真島吾朗', employee_id: '10005', email: 'test5@yahoo.co.jp', password: 'test555', password_confirmation: 'test555', role: 0)

31.times do |n|
    Attendance.create!(
      attendance_date:"2022-05-#{n + 1}",
      attendance_time: "10:00:00",
      leave_office_time: "19:00:00",
      user_id: 1,
    )
  end
  31.times do |n|
    Attendance.create!(
      attendance_date:"2022-05-#{n + 1}",
      attendance_time: "10:00:00",
      leave_office_time: "19:00:00",
      user_id: 2,
    )
  end
  31.times do |n|
    Attendance.create!(
      attendance_date:"2022-05-#{n + 1}",
      attendance_time: "10:00:00",
      leave_office_time: "19:00:00",
      user_id: 3,
    )
  end
  31.times do |n|
    Attendance.create!(
      attendance_date:"2022-05-#{n + 1}",
      attendance_time: "10:00:00",
      leave_office_time: "19:00:00",
      user_id: 4,
    )
  end
  31.times do |n|
    Attendance.create!(
      attendance_date:"2022-05-#{n + 1}",
      attendance_time: "10:00:00",
      leave_office_time: "19:00:00",
      user_id: 5,
    )
  end