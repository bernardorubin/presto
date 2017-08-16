class Requisition < ApplicationRecord
  belongs_to :user
  has_many :personal_references
  scope :latest_first, -> {order(created_at: :desc)}
  validates :income, presence: true, numericality: true
  validates :address_years, numericality: true
  validates :company_years, numericality: true
  validates :requested_amount, :bank, presence: true

  validate :custom_validation

  accepts_nested_attributes_for :personal_references, reject_if: :all_blank, allow_destroy: true

  def custom_validation
    # if title.present? && title.downcase.include?('something')
    #   errors.add(:title, 'No somethings please!')
    # end
  end
  # validates(:title, { presence: { message: 'must be given!' },
  #                     uniqueness: true })
  # validates :body, presence: true, length: { minimum: 3 }
  # validates :view_count, presence: true,
  #           numericality: { greater_than_or_equal_to: 0 }
end
