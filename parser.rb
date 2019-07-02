require 'nokogiri'

class Parser

  XSLT_PATH = File.expand_path('./file/csv_template.xslt', __dir__) 

  def initialize htmls, xslt: File.read(XSLT_PATH), post_correct: true
    @post_correct = post_correct
    @htmls  = [htmls].flatten 
    @xslt   = xslt
  end

  def csv
    @csv ||= template.apply_to(source).to_s
  end

  private

  def source
    @source ||= Nokogiri::HTML(
      @htmls.map do |html|
        (m = html.match(/<\s*table.*?<\s*\/\s*table\s*>/m)) ? m[0] : ''
      end.join
    )
  end

  def template
    @template ||= Nokogiri::XSLT(@xslt)
  end
end
