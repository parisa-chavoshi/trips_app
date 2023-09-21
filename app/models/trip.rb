class Trip < ApplicationRecord
  before_create :assign_uuid

  validates_uniqueness_of :uuid, scope: %i[assignee]

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', required: true
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', required: true

  enum :status, { unstarted: 0, in_progress: 1, completed: 2 }

  def mark_outdated
    self.current_assignment = false 
    self.save! 
  end 

  def can_be_reassigned_by?(user)
    self.current_assignment == true &&
      self.assignee == user && 
        self.unstarted?
  end 

  def can_be_checked_in_by?(user)
    self.current_assignment == true &&
      self.assignee == user && 
        self.unstarted?
  end 

  def can_be_checked_out_by?(user)
    self.current_assignment == true &&
      self.assignee == user && 
        self.in_progress?
  end 

  private 
  def assign_uuid 
    self.uuid ||= SecureRandom.uuid
  end 
end
