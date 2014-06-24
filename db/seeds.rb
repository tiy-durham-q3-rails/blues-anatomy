# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

henry = Doctor.create(first_name: "Henry", last_name: "Jenkins", taciturn: true, speciality: "ent")
marge = Doctor.create(first_name: "Margaret", last_name: "Butters", taciturn: true, speciality: "family medicine")

erin = Patient.create(name: "Erin")
brian = Patient.create(name: "Brian")
seb = Patient.create(name: "Sebastian")

Appointment.create(doctor: henry, patient: erin, when: Time.zone.now)
Appointment.create(doctor: henry, patient: brian, when: Time.zone.now)
Appointment.create(doctor: marge, patient: erin, when: Time.zone.now)
Appointment.create(doctor: marge, patient: seb, when: Time.zone.now)
