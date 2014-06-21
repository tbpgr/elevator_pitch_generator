# encoding: utf-8
require 'elevator_pitch_generator_dsl_model'

module ElevatorPitchGenerator
  # DSL
  class Dsl
    attr_accessor :elevator_pitch_generator

    # String Define
    [
      :needs, :target, :product_name, :category,
      :merit, :diff_of_competition, :most_important_point].each do |f|
      define_method f do |value|
        @elevator_pitch_generator.send("#{f}=", value)
      end
    end

    # Array/Hash/Boolean Define
    [].each do |f|
      define_method f do |value|
        @elevator_pitch_generator.send("#{f}=", value)
      end
    end

    # rubocop:disable LineLength
    def initialize
      @elevator_pitch_generator = ElevatorPitchGenerator::DslModel.new
      @elevator_pitch_generator.needs = 'For TODO: write potential needs or solution'
      @elevator_pitch_generator.target = 'who TODO: write target'
      @elevator_pitch_generator.product_name = 'The TODO: write product_name'
      @elevator_pitch_generator.category = 'is a TODO: write category'
      @elevator_pitch_generator.merit = 'that TODO: write merit'
      @elevator_pitch_generator.diff_of_competition = 'Unlike TODO: write difference of competition'
      @elevator_pitch_generator.most_important_point = 'it TODO: write most important point'
    end
    # rubocop:enable LineLength
  end
end
