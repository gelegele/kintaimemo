class Attendance
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes # Added to show Date and Time field.
  field :date, :type => Date
  field :in, :type => Time
  field :out, :type => Time
  field :note, :type => String

  validates_presence_of :date
  validates_uniqueness_of :date, message: 'already exists.'
  validates_each :in do |model, attr, value|
    model.errors.add(attr, 'must be less than out.') if model.in && model.out && model.out <= model.in
  end

end
