class User < ActiveRecord::Base
  # before_action :authenticate_team
  belongs_to :team
  before_save :validate_number
  after_save :set_users_to_available, :create_message
  before_create :set_order_number, :create_message

  def create_message
    if self.girl == true
      self.message = "#{self.name}, It looks like it's your turn to help plan the activity next thursday. :)"
    else
      self.message = "#{self.name}, Your machismo has earned you a chance to show off your leadership skills, you get to plan next thursday's activity!"
    end
  end  

  def set_users_to_available
    unless User.where(available: true, girl: true).any?
      User.where(girl: true).each do |girl|
        girl.update(available: true)
      end    
    end
    unless User.where(available: true, girl: false).any?
      User.where(girl: false).each do |boy|
        boy.update(available: true)
      end    
    end    
  end  

  def paired_message(user)
    "#{message} You are paired with #{user.name} this week, and their number is #{user.number}"
  end  
    
  def self.pair
    paired_array = []
    girl = User.where(girl: true, available: true).sample || User.where(girl: true).sample
    boy = User.where(girl: false, available: true).sample || User.where(girl: false).sample
    paired_array << girl
    paired_array << boy
    girl.update(available: false)
    boy.update(available: false)
    paired_array
  end   

  def validate_number
    return false unless self.number
    number = self.number.gsub(/[^\d]/, '')
    unless number.length == 10
      errors.add(:phone_number, "must have 10 digits.")
    end  
  end 

  def self.find_next_person
    this_person = where(is_next: true).first || User.first
    next_person = this_person.find_next_person
    this_person.update(is_next: false)
    next_person.update(is_next: true)
    return this_person
  end  

  def find_next_person
    User.find_by_order_number(order_number+1) || User.find_by_order_number(1)
  end  

  def set_order_number
    self.order_number = (User.all.collect(&:order_number).sort.last || 0) + 1
  end  
end
