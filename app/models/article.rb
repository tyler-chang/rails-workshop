# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord
  validates :title, presence: true

  before_validation :custom_before_validate
  after_validation :custom_after_validate
  before_save :custom_before_save
  around_save :custom_around_save
  before_create :custom_before_create
  around_create :custom_around_create
  after_create :custom_after_create
  after_save :custom_after_save
  after_commit :custom_after_commit

  def custom_before_validate
    ap 'custom_before_validate'
    ap self.errors
  end

  def custom_after_validate
    ap 'custom_after_validate'
    ap self.errors
  end

  def custom_before_save
    ap 'custom_before_save --------'
    ap self
  end

  def custom_around_save
    ap 'custom_around_save1 --------'
    ap self
    ap self.new_record?
    yield
    ap 'custom_around_save2 --------'
    ap self
    ap self.new_record?
  end

  def custom_before_create
    ap 'custom_before_create --------'
    ap self
  end

  def custom_around_create
    ap 'custom_around_create1 --------'
    ap self
    ap self.new_record?
    yield
    ap 'custom_around_create2 --------'
    ap self
    ap self.new_record?
  end

  def custom_after_create
    ap 'custom_after_create --------'
    ap self
  end

  def custom_after_save
    ap 'custom_after_save --------'
    ap self
  end

  def custom_after_commit
    ap 'after_commit --------'
    ap self
  end
end
