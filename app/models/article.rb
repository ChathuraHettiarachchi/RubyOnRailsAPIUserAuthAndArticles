# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :body, :user_id, presence: true

  belongs_to :user
end
