# encoding: utf-8
require 'elevator_pitch_generator_dsl'
require 'erb'

# ElevatorPitchGenerator
module ElevatorPitchGenerator
  #  ElevatorPitchGenerator Core
  class Core
    ELEVATOR_PITCH_GENERATOR_FILE = 'Epitchfile'
    ELEVATOR_PITCH_GENERATOR_TEMPLATE = <<-EOS
# encoding: utf-8

# For [potential needs or solution]
# needs is required
# needs allow only String
# needs's default value => "For TODO: write potential needs or solution"
needs "For TODO: write potential needs or solution"

# who [target]
# target is required
# target allow only String
# target's default value => "who TODO: write target"
target "who TODO: write target"

# The [product_name]
# product_name is required
# product_name allow only String
# product_name's default value => "The TODO: write product_name"
product_name "The TODO: write product_name"

# is a [category]
# category is required
# category allow only String
# category's default value => "is a TODO: write category"
category "is a TODO: write category"

# that [merit]
# merit is required
# merit allow only String
# merit's default value => "that TODO: write merit"
merit "that TODO: write merit"

# Unlike [difference of competition]
# diff_of_competition is required
# diff_of_competition allow only String
# diff_of_competition's default value => "Unlike TODO: write difference of competition"
diff_of_competition "Unlike TODO: write difference of competition"

# it [most important point]
# most_important_point is required
# most_important_point allow only String
# most_important_point's default value => "it TODO: write most important point"
most_important_point "it TODO: write most important point"
    EOS

    ELEVATOR_PITCH_OUTPUT_PATH = './elevator_pitch/README.md'
    ELEVATOR_PITCH_OUTPUT_TEMPLATE = <<-EOS
# <%=product_name%>'s Elevator Pitch

## <%=needs%>
## <%=target%>
## <%=product_name%>
## <%=category%>
## <%=merit%>
## <%=diff_of_competition%>
## <%=most_important_point%>
    EOS

    # == generate Epitchfile to current directory.
    def init
      File.open(ELEVATOR_PITCH_GENERATOR_FILE, 'w') { |f|f.puts ELEVATOR_PITCH_GENERATOR_TEMPLATE }
    end

    # == generate Elevator Pitch
    def execute
      src = read_dsl
      dsl = ElevatorPitchGenerator::Dsl.new
      dsl.instance_eval src
      Dir.mkdir('elevator_pitch') unless Dir.exists?('elevator_pitch')
      File.open(ELEVATOR_PITCH_OUTPUT_PATH, 'w:UTF-8') { |f|f.print adapt_template(dsl) }
    end

    private

    def read_dsl
      File.open(ELEVATOR_PITCH_GENERATOR_FILE) { |f|f.read }
    end

    # rubocop:disable UselessAssignment
    def adapt_template(dsl)
      product_name = dsl.elevator_pitch_generator.product_name
      needs = dsl.elevator_pitch_generator.needs
      target = dsl.elevator_pitch_generator.target
      product_name = dsl.elevator_pitch_generator.product_name
      category = dsl.elevator_pitch_generator.category
      merit = dsl.elevator_pitch_generator.merit
      diff_of_competition = dsl.elevator_pitch_generator.diff_of_competition
      most_important_point = dsl.elevator_pitch_generator.most_important_point
      erb = ERB.new(ELEVATOR_PITCH_OUTPUT_TEMPLATE)
      erb.result(binding)
    end
    # rubocop:enable UselessAssignment
  end
end
