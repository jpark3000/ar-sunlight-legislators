require 'csv'
require_relative '../app/models/congress_member'


class SunlightLegislatorsImporter
  def self.import(filename)
    attributes = {}
    desired_fields = CongressMember.columns.map { |c| c.name.to_sym }

    csv = CSV.new(File.open(filename), :headers => true, :header_converters => :symbol)
    csv.each do |row|
      row.each do |field, value|
        if desired_fields.include?(field)
          attributes[field] = value
        end
      end
      CongressMember.create(attributes)
    end
  end
end



# SunlightLegislatorsImporter.import(File.dirname(__FILE__) + "/../db/data/legislators.csv")


# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
