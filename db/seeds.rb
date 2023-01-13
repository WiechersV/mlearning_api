# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_college = College.create
second_college = College.create
exam = Exam.create(college: first_college)
exam_window = ExamWindow.create(exam: exam, start_time: DateTime.new(2023, 01, 14))