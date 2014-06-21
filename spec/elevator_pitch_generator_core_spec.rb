# encoding: utf-8
require 'spec_helper'
require 'elevator_pitch_generator_core'

describe ElevatorPitchGenerator::Core do
  context :execute do
    OUTPUT_TMP_DIR = 'tmp'
    INPUT_CASE1 = <<-EOS
# encoding: utf-8

needs "For creator"
target "who supply some product"
product_name "The Elevator Pitch Generator"
category "is a generator of Elevator Pitch"
merit "that generate Elevator Pitch template automatically"
diff_of_competition "Unlike manuall-create that is redundant operation"
most_important_point "it provides formated template for Elevator Pitch"
    EOS

    EXPECTED_OUTPUT_CASE1 = <<-EOS
# The Elevator Pitch Generator's Elevator Pitch

## For creator
## who supply some product
## The Elevator Pitch Generator
## is a generator of Elevator Pitch
## that generate Elevator Pitch template automatically
## Unlike manuall-create that is redundant operation
## it provides formated template for Elevator Pitch
    EOS
    cases = [
      {
        case_no: 1,
        case_title: 'valid elevator pitch',
        input: INPUT_CASE1,
        expected_file_name: './elevator_pitch/README.md',
        expected_file_content: EXPECTED_OUTPUT_CASE1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          elevator_pitch_generator_core = ElevatorPitchGenerator::Core.new

          # -- when --
          elevator_pitch_generator_core.execute

          # -- then --
          file_exists = File.exist?(c[:expected_file_name])
          expect(file_exists).to be_true
          actual = File.read(c[:expected_file_name])
          expect(actual).to eq(c[:expected_file_content])
        ensure
          case_after c
        end
      end

      def case_before(c)
        Dir.mkdir(OUTPUT_TMP_DIR) unless Dir.exist? OUTPUT_TMP_DIR
        Dir.chdir(OUTPUT_TMP_DIR)
        gem_file = ElevatorPitchGenerator::Core::ELEVATOR_PITCH_GENERATOR_FILE
        File.open(gem_file, 'w:utf-8') { |f|f.print c[:input] }
      end

      def case_after(c) # rubocop:disable UnusedMethodArgument
        Dir.chdir('../')
        FileUtils.rm_rf(OUTPUT_TMP_DIR) if Dir.exist? OUTPUT_TMP_DIR
      end
    end
  end
end
