require "fake_profile_image/version"

module FakeProfileImages
  class Error < StandardError; end

  class << self
    def file(gender: nil, age: nil, seq_number: nil)
      gender = gender || rand(0..1) ? :m : :f
      age = age || rand(20..60)
      seq_number = seq_number || rand(1..10)
      image_file_prefix = "#{gender}_#{format('%02d', age)}_#{format('%02d', seq_number)}"
      file_name = Dir.glob("./lib/images/#{image_file_prefix}_*.jpg")[0]
      File.open(file_name, "r")
    end
  end
end
