class Task
  include Mongoid::Document

  # Fields  
  field :name
  field :isCompleted, :type => Boolean

  # Structure
  belongs_to :user
  belongs_to :tag
  
  # Validations
  validates_presence_of :name
end
