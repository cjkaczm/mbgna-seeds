#native seed parser
#cjkaczma
#2018.5.24
#Read the native seeds list and export seperate .csv's for each environment

require 'C:\Ruby24-x64\lib\ruby\2.4.0\csv.rb'

ALL_FILEPATH = 'all_species.csv'
ENVIRONMENTS = [
  'woods',
  'dappled woods',
  'wetland sun',
  'wetland shade',
  'riparian',
  'prairie',
  'alvar',
  'dune'
]

all_species_csv = CSV.read(ALL_FILEPATH)

ENVIRONMENTS.length.times do |i|
  puts ENVIRONMENTS[i]
	#Reads through each line of the "all" file and writes the line to the output
	#if the environment is checked
  current_output = CSV.open(ENVIRONMENTS[i] + ".csv", "w")
  #Writes header
  current_output << [
                    'Scientific Name',
                    'Common Name',
                    'Apr',
                    'May',
                    'Jun',
                    'Jul',
                    'Aug',
                    'Sep',
                    'Oct',
                    'Nov',
                    'Status',
                    'C',
                    'W',
                    ]

	all_species_csv.each do |species|
		if species[0] == 'Scientific Name' #Hack to skip the headers
		elsif species[i + 2]
			current_output << [
                        species[0], #Scientific name
                        species[1], #Common name
                        species[10], #Apr
                        species[11], #May
                        species[12], #Jun
                        species[13], #Jul
                        species[14], #Aug
                        species[15], #Sep
                        species[16], #Oct
                        species[17], #Nov
                        species[18], #SC/T
                        species[19], #Coeff of concern
                        species[20], #Wetness
                      ]
		end
	end
  current_output.close
end
