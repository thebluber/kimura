namespace :db do
  task :fill_wadoku => :environment do
    list = open("wadokus.txt").readlines.compact
    Wadoku.transaction do
      list.map do |l| 
        wadoku = Hash.new
        begin 
          lis = l.gsub!(" \n", "").split("\t ")
          wadoku[:entry] = lis[0] #this is wadoku_id
          wadoku[:contents] = lis[1]

          puts wadoku.to_s
          entry = Wadoku.new(wadoku)
          entry.save
        rescue Exception => e
          file = open("wadoku_error", "a+")
          file.puts l
          file.puts e
          file.puts "-------------"
          file.close
        end
      end
    end
  end
end
