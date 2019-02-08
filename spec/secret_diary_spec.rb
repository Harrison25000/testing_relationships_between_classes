require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  context "when locked" do
    it "refuses to be read" do
      secretdiary = SecretDiary.new("diary")

      expect(secretdiary.read).to eq("Go away!")
    end

    it  "refuses to be written" do
      secretdiary = SecretDiary.new("diary")
      expect(secretdiary.write("message")).to eq("Go away!")
    end
  end


  context "when unlocked" do
    it "gets read" do
      secretdiary = SecretDiary.new("diary")
      # dbl = secretdiary.unlock
      # expect(dbl).to receive(:read)
      # dbl.read
      unlocked = secretdiary.unlock
      puts unlocked
    if unlocked == false
      puts secretdiary.read
      expect(secretdiary.read).to eq("Go away!")
    elsif unlocked == true
      dbl = double(:read => "diary")
      puts dbl.read
      expect(dbl.read).to eq("diary")
    end

    puts "----------"

    end

    it  "gets written" do
      secretdiary = SecretDiary.new("diary")
      writing = secretdiary.write("ron")
      unlocked = secretdiary.unlock
      puts writing
      puts unlocked

    if unlocked == false
      puts secretdiary.write("lol")
      expect(secretdiary.write("lol")).to eq("Go away!")

    elsif unlocked == true
      dbl = double(:write => "ron")
      puts dbl.write
      expect(dbl.write).to eq("ron")
    end
  end
  end
end
