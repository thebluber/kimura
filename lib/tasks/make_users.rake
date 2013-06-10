namespace :db do
  task :make_users => :environment do
    list = open("emails").readlines
    min = 1
    max = 410
    Kimura.transaction do 
      list.map do |l| 
        l.gsub!("\n", "")
        begin 
          user = User.new()
          user.email = l
          user.password = "password"
          user.password_confirmation = "password"
          user.save
          min.upto(max) do |kimura_id|
            kimura = Kimura.find(kimura_id)
            kimura.user = user
            kimura.save
            puts kimura
          end
          min = max + 1
          max = max + 410 > Kimura.count ? Kimura.count : max + 410


        rescue Exception => e
          puts e
        end
      end
    end
  end
end
