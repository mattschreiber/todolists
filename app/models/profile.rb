class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: {in: %w(male female)}
  validate :first_name_and_last_name_cannot_be_nil
  validate :gender_male_not_named_sue

  def first_name_and_last_name_cannot_be_nil
  		errors.add(:base, "First and Last name both can't be empty") if first_name.nil? && last_name.nil?
  end

  def gender_male_not_named_sue
  		errors.add(:first_name, "can't be Sue") if gender.to_s.downcase.eql?("male") && first_name.to_s.downcase.eql?("sue")
  end

  def self.get_all_profiles(min, max)
  	Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(birth_year: :asc)
  end

 end
