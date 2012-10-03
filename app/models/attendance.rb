class Attendance
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes # Added to show Date and Time field.
  field :date, :type => Date
  field :in, :type => Time
  field :out, :type => Time
  field :note, :type => String
end
