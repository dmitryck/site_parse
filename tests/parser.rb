require 'minitest/autorun'
require_relative '../parser'

class ParserTest < Minitest::Test

  SOURCE = File.read File.expand_path('./parser/source.html', __dir__)
  RESULT = File.read File.expand_path('./parser/result.csv', __dir__)

  def test_csv_result
    assert_equal Parser.new(SOURCE).csv, RESULT
  end
end
