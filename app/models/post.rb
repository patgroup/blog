class Post < ActiveRecord::Base
  attr_accessible :content, :title, :created_at, :updated_at, :id
  
  validates_presence_of   :content, :title
  validate                :validate_title
  
  def validate_title
    puts "post#validate"
    puts "params #{self.inspect}"
    if self.title && self.title =~ /( bad )/
      return false
    else
      return true
    end
  end
end
