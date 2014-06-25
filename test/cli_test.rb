require './test/test_helper'
require './lib/cli'
require './lib/help'

class CLITest < Minitest::Test
  attr_reader :cli

  def test_it_exists
    cli = Cli.new
    assert cli
  end

  def test_input_parser_passes_load_to_load
    skip
    cli = Cli.new
    input = cli.input_parser('load')
    assert cli.load_command_parser([])
  end
  
  def test_it_gets_load_help
    skip
    cli = Cli.new
    cli.help_command_parser([])
    assert Help.help
  end

# test queue menu
# test find menu
# test input parser
# probably test input parser a few more times
# test load command parser
# test find command parser
# test help command parser
# test queue command parser


end
