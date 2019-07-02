require 'rest-client'
require 'yaml'

class Responser
  URL = 'https://certification.pmi.org/registry.aspx'

  METHOD = :post

  PARAM_CASSETTE = YAML.load_file(
    File.expand_path('./file/param_cassette.yml', __dir__)
  )

  def initialize country:, sym_from:, sym_to:, trace: true
    @country    = country
    @sym_from   = sym_from
    @sym_to     = sym_to

    @trace      = trace
  end

  def htmls
    @htmls ||= responses.map(&:body)
  end

  private

  def responses
    @responses ||= params.reduce([]) do |responses, param|
      puts "request #{param}.." if @trace

      responses << RestClient.send(METHOD, URL, PARAM_CASSETTE.merge(param))
    end
  end

  def params
    (@sym_from..@sym_to).to_a.reduce([]) do |params, value|
      params << {
        'dph_RegistryContent$wcountry' => @country,
        'dph_RegistryContent$tbSearch' =>	value
      }
    end
  end
end
