# clock_spec.rb

require "minitest/autorun"
require "minitest/reporters"

require_relative "../lib/clock"

Minitest::Reporters.use!

describe "clock" do
  it "will return a string" do
    # Arrange
    hours = 8
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect(time).must_be_instance_of String
  end

  it "will return the properly formatted time" do
    # Arrange
    hours = 8
    minutes = 14
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect(time).must_equal "08:14:27"
  end

  it "will return the properly formatted time with minutes less than 10" do
    # Arrange
    hours = 14
    minutes = 8
    seconds = 27

    # Act
    time = clock(hours, minutes, seconds)

    # Assert
    expect(time).must_equal "14:08:27"
  end

  it "will display leading zeros for numbers smaller than 10" do
    time = clock(11, 8, 14)
    expect(time).must_equal "11:08:14"

    time = clock(8, 11, 14)
    expect(time).must_equal "08:11:14"

    time = clock(11, 14, 8)
    expect(time).must_equal "11:14:08"
  end

  it "will raise an ArgumentError if hours, minutes or seconds are too large" do
    expect {
      clock(25, 32, 16)
    }.must_raise ArgumentError

    expect {
      clock(23, 60, 16)
    }.must_raise ArgumentError
  end
end
