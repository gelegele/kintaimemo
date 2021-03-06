class Monthly
  include Mongoid::Document
  field :year, :type => Integer
  field :month, :type => Integer
  field :status, :type => String

  embeds_many :attendances

  validates :year, :presence => true, :uniqueness => {:scope => [:month]}
  validates :month, :presence => true

  default_scope asc(:year, :month)
end
