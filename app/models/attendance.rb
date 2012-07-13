class Attendance < ActiveRecord::Base
  attr_accessible :date, :in, :note, :out
end
