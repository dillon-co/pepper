class User < ActiveRecord::Base
  belongs_to :team
  before_save :validate_number
  before_create :set_order_number

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
    self.order_number = (User.all.collect(&order_number).sort.last || 0) + 1
  end  

end
