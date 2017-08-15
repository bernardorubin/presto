class Requisition < ApplicationRecord
  belongs_to :user
  scope :latest_first, -> {order(created_at: :desc)}
  validates :income, presence: true
  validate :no_monkey

  def no_monkey
    # if title.present? && title.downcase.include?('monkey')
    #   errors.add(:title, 'No monkeys please!')
    # end
  end
  # validates(:title, { presence: { message: 'must be given!' },
  #                     uniqueness: true })
  # validates :body, presence: true, length: { minimum: 3 }
  # validates :view_count, presence: true,
  #           numericality: { greater_than_or_equal_to: 0 }
end
