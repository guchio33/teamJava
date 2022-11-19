# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Tagテーブル
Tag.create(tag: "名城大学")

#Statusテーブル
Status.create(status_name: "取引中")

#postテーブル
Post.create!(title: "教科書", image:"aaa",comment:"去年使ってました",status_id:1)

School.create(name: "名城大学", faculty_id:1, department_id:1, grade:4)
#Faculite(学部)テーブル
Faculty.create(name: "都市情報学部")
#Department(学科)テーブル
Department.create(name: "都市情報学科")
