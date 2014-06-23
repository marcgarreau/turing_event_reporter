require './test/test_helper'
require './lib/cli'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    ldr = Loader.new
    ldr.clean_people
    # repository = EntryRepository.in("./test/fixtures")
    # phone_book = PhoneBook.new(repository)
    @cli ||= CLI.new(phone_book)
  end

  def test_it_exists
    skip
    assert cli
  end

  def test_it_has_a_command
    skip
    assert cli.command
  end

  def test_it_has_parameters
    skip
    assert cli.parameters
  end

  def test_it_has_a_phonebook
    skip
    assert cli.phone_book
  end

  def test_it_processes_input
    skip
    input = 'lookup "Hudson"'
    result = cli.process_input(input)

    assert_equal ['lookup', '"Hudson"'], result
  end

  def test_it_formats_parameters
    skip
    input = 'lookup "Hudson, Clara"'
    parts      = cli.process_input(input)
    parameters = parts[1..-1]
    result     = cli.format_parameters(parameters)
    assert_equal "Hudson, Clara", result
  end

  def test_it_assigns_instructions
    skip
    input = 'lookup "Smith, Alice"'
    parts = cli.process_input(input)
    cli.assigns_instructions(parts)

    assert_equal 'lookup',      cli.command
    assert_equal 'Smith, Alice', cli.parameters
  end

  def test_it_assigns_instructions_with_flag
    skip
    input = 'lookup -r "(123) 345-6789"'
    parts = cli.process_input(input)
    cli.assigns_instructions(parts)

    assert_equal 'lookup -r', cli.command
    assert_equal '(123) 345-6789', cli.parameters
  end

  def test_it_executes_commands
    skip
    input = 'lookup "Smith, Alice"'
    parts = cli.process_input(input)
    cli.assigns_instructions(parts)
    result = cli.execute_commands.first

    assert_equal "Alice",            result.first_name
    assert_equal "Smith",            result.last_name
    assert_equal ["(111) 000-1234"], result.numbers
  end

end
