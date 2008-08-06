class Student < ActiveRecord::Base
  belongs_to :promotion
  
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :date_of_birth
  
  named_scope :scientifics, :conditions => {:section => "S"}
  named_scope :majors     , :conditions => ['date_of_birth < ?', 18.years.ago]
  named_scope :minors     , :conditions => ['date_of_birth > ?', 18.years.ago]

  
  def to_param
    "#{id}-#{firstname}_#{lastname}"
  end
  
  def fullname 
    [firstname, lastname].join(' ')
  end
  
  def age
    age = Time.now.year - date_of_birth.year
    age-=1 if Time.now.yday <= date_of_birth.yday    #retirer 1 an si la date anniversaire n'est pas passée cette année
    age
  end
  
  def major?
    age >= 18
  end
end
