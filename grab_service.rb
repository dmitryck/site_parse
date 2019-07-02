require 'rest-client'
require_relative 'responser'
require_relative 'parser'

class GrabService

  attr_reader :params
  attr_reader :csv

  def initialize params
    @params = params
  end

  def get_csv!
    htmls = Responser.new(@params).htmls

    @csv = Parser.new(htmls).csv
  end
end
