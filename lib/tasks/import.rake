require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "db/userlocation.csv"

  CSV.foreach(file, :headers => true) do |row|
    User.update {
      :location
     
    }
  end

end
