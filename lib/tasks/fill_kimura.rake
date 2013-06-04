namespace :db do
  task :fill_kimura => :environment do
    list = open("toparse.txt").readlines
    list.map do |l| 
      kimura = Hash.new
      l.gsub!(" \n", "")
      lis1 = l.split("; ")
      lis2 = lis1[2].split("\t")
      kimura[:kimura_page] = lis1[0].split[1]
      kimura[:kimura_column] = lis1[1].split[1]
      kimura[:kimura_lemma] = lis2[0].split[1]
      kimura[:kimura_reading] = lis2[1]
      if lis2[2].to_i != 0
        kimura[:kimura_wadoku_candidates] = lis2[2]
        kimura[:kimura_hasCandidates] = true
      end
      kimura[:kimura_isEdited] = false

      begin 
        puts kimura.to_s
        entry = Kimura.new(kimura)
        entry.save
      rescue Exception => e
        file = open("kimura_error", "a+")
        file.puts l
        file.puts e
        file.puts "-------------"
        file.close
      end
    end

  end
end
