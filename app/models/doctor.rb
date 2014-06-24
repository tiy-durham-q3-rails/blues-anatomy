class Doctor < ActiveRecord::Base
  SPECIALITIES = ["OB/GYN", "Opthamology", "Pediatrics",
    "Family Medicine", "ENT", "Gastrointestinal"]

  has_many :appointments
  belongs_to :supervisor, class_name: "Doctor"
  has_many :reports, class_name: "Doctor", foreign_key: "supervisor_id"
  has_many :patients, :through => :appointments

  validates :speciality,
    presence: true,
    inclusion: { in: SPECIALITIES,
                 message: "%{value} is not a valid speciality"}

  validates :bio,
    presence: true,
    length: { in: 100..500, allow_nil: true },
    unless: :taciturn?

  validates :bio,
    absence: true,
    if: :taciturn?

  before_validation :normalize_speciality

  def normalize_speciality
    return if speciality.blank?

    normalized = SPECIALITIES.find do |canonical|
      canonical.downcase == speciality.downcase
    end

    self.speciality = normalized
  end

  around_save :print_stuff

  def print_stuff
    puts "I haven't saved yet!"
    yield
    puts "I have been saved!"
  end
end
