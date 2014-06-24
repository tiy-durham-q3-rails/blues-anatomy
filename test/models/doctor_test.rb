require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test "taciturn doctors cannot have a bio" do
    doctor = Doctor.new(taciturn: true, bio: "blahhhhhh")
    assert doctor.invalid?
    assert doctor.errors[:bio].any?
  end

  test "non-taciturn doctors require a bio" do
    doctor = Doctor.new(taciturn: false)
    refute doctor.valid?
    refute doctor.errors[:bio].empty?
  end

  test "specialities are normalized in casing" do
    doctor = Doctor.new(speciality: "ent")
    doctor.valid?
    assert_equal "ENT", doctor.speciality
  end
end
