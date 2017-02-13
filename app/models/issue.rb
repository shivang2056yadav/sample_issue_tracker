class Issue < ApplicationRecord
  belongs_to :assigned_to, :class_name => 'User'

  validates_presence_of :subject, :description
  validates_length_of :subject, :maximum => 50
  validates_uniqueness_of :subject

end
