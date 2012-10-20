class Attendance
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes # Added to show Date and Time field.
  field :date, :type => Date
  field :in, :type => Time
  field :out, :type => Time
  field :note, :type => String

  validates :date, :presence => true, :uniqueness => {:message => 'already exists.'} 
  validates :in, :compare => {:compare_to => 'out', :type => :less_than}

  default_scope asc(:date)
end
