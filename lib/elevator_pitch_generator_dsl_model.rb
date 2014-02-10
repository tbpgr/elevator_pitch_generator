# encoding: utf-8
require 'active_model'

module ElevatorPitchGenerator
  # DslModel
  class DslModel
    include ActiveModel::Model

    # For [potential needs or solution]
    attr_accessor :needs
    validates :needs, presence: true

    # who [target]
    attr_accessor :target
    validates :target, presence: true

    # The [product_name]
    attr_accessor :product_name
    validates :product_name, presence: true

    # is a [category]
    attr_accessor :category
    validates :category, presence: true

    # that [merit]
    attr_accessor :merit
    validates :merit, presence: true

    # Unlike [difference of competition]
    attr_accessor :diff_of_competition
    validates :diff_of_competition, presence: true

    # it [most important point]
    attr_accessor :most_important_point
    validates :most_important_point, presence: true
  end
end
