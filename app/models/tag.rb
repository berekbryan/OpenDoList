class Tag
  include Mongoid::Document
  
  # Fields
  field :name
  
  # Structure
  belongs_to :user
  has_many :tasks
  
  # Validations
  validates_presence_of :name
end

