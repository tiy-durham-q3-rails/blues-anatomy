class Doctor < ActiveRecord::Base
  validates :speciality,
    presence: true,
    inclusion: { in: [
      "OB/GYN", "Opthamology", "Pediatrics", "Family Medicine",
      "ENT", "Gastrointestinal"],
                 message: "%{value} is not a valid speciality"}

  validates :bio,
    presence: true,
    length: { in: 100..500 },
    unless: :taciturn?

  validates :bio,
    absence: true,
    if: :taciturn?
end
