class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attrs) { attrs['name'].blank? }
  include PlaceHolder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= PlaceHolder.image_generator(height: '600', width: '400')
    self.thumb_image ||= PlaceHolder.image_generator(height: '350', width: '200')
  end
end
