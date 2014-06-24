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
end
