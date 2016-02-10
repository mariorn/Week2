require './password'
require 'rspec'

RSpec.describe "Unit test for PasswordChecker" do  

  describe "#characters" do
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.characters("hola")).to eq(false)
    end
  end

  describe "content_symbol" do
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.content_symbols("hola")).to eq(false)
    end
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.content_symbols("hola1")).to eq(false)
    end
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.content_symbols("hola1&@hola")).to eq(false)
    end
  end

  describe "check_lowercase" do
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.check_lowercase("hoLa1&@hola")).to eq(true)
    end
  end

   describe "check_uppwercase" do
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.check_uppercase("hoLa1&@hola")).to eq(true)
    end
  end

   describe "content_case" do
    it "returns false when the password length is less than 7" do
      expect(PasswordChecker.new.content_case("hoLa1&@hola")).to eq(true)
    end
  end

   describe "content_case" do
    it "get the name of the user from its email" do
      expect(PasswordChecker.new.get_name("eli@ironhack.com")).to eq("eli")
    end
  end

   describe "content_name" do
    it "check the name is in the password" do
      expect(PasswordChecker.new.content_name("eli@ironhack.com", "eli234")).to eq(true)
    end
  end

    describe "check_password" do
    it "check the name is in the password" do
      expect(PasswordChecker.new.check_password("eli@ironhack.com", "eli234")).to eq(false)
      expect(PasswordChecker.new.check_password("eli@ironhack.com", "hoLa1&@hola")).to eq(true)
    end
  end


  end
