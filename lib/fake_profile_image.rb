require "fake_profile_image/version"
CURRENT_DIR = File.expand_path("..", __FILE__)

module FakeProfileImage
  class << self
    def file(gender: nil, age: nil, seq_number: nil)
      raise ArgumentError, "gender must be :male or :female" if !gender.nil? && ![:male, :female].include?(gender)
      gender = gender || [true, false].sample ? 'm' : 'f'

      raise ArgumentError, "age must be between 20 and 60" if !age.nil? && !(20..60).include?(age)
      age = age || rand(20..60)

      raise ArgumentError, "seq_number must be between 1 and 10" if seq_number.nil? && (1..10).include?(seq_number)
      seq_number = seq_number || rand(1..10)

      image_file_prefix = "#{gender}_#{format('%02d', age)}_#{format('%02d', seq_number)}"
      file_name = Dir.glob("#{CURRENT_DIR}/images/#{image_file_prefix}_*.jpg")[0]
      File.open(file_name, "r")
    end
  end
end
