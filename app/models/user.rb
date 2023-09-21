class User < ApplicationRecord
    has_many :owned_trips,    class_name: "Trip", foreign_key: "owner_id"
    has_many :assigned_trips, class_name: "Trip", foreign_key: "assignee_id"
  end
  