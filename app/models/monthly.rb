class Monthly
  include Mongoid::Document
  field :year, :type => Integer
  field :month, :type => Integer
  field :status, :type => String

  validates :year, :presence => true
  validates :month, :presence => true

  default_scope asc(:year, :month)
end
