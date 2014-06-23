load './lib/loader.rb'
ldr = Loader.new
ldr.clean_people
ldr.find_by(:last_name, "Nguyen")
