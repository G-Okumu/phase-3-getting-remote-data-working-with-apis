require 'net/http'
require 'open-uri'
require 'json'
require "awesome_print" 

class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = self.get_programs
      programs.collect do |program|
        program["agency"]
      end
    end
end

# programs = GetPrograms.new.get_programs
# ap programs

programs = GetPrograms.new
puts programs.program_school.uniq
