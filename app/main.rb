require_relative 'models/congress_member'
require_relative 'models/tweet'

def cm_by_state(state)
  puts "Senators:"
  CongressMember.select("firstname, lastname, party").where(state: state, title: "Sen").each do |cm|
    puts "#{cm.firstname} #{cm.lastname} (#{cm.party})"
  end
  puts "\nRepresntatives:"
  CongressMember.select("firstname, lastname, party").where(state: state, title: "Rep").each do |cm|
    puts "#{cm.firstname} #{cm.lastname} (#{cm.party})"
  end
end

# cm_by_state("CA")

def gender_percentage(gender)
  gender_hash = {"M" => "Male", "F" => "Female"}
  total_senate = CongressMember.where(title: "Sen", in_office: "1").count
  total_rep = CongressMember.where(title: "Rep", in_office: "1").count
  num_gender_senate = CongressMember.where(gender: gender, title: "Sen", in_office: "1").count
  num_gender_rep = CongressMember.where(gender: gender, title: "Rep", in_office: "1").count

  puts "#{gender_hash[gender]} Senators: #{num_gender_senate}: (#{(num_gender_senate.to_f/total_senate.to_f) * 100}%)"
  puts "#{gender_hash[gender]} Representatives: #{num_gender_rep}: (#{(num_gender_rep.to_f/total_rep.to_f) * 100}%)"
end

# gender_percentage("F")

def list_by_state_and_cm_count
  rep = CongressMember.where(in_office: "1", title: "Rep").group("state").having("count(*) > 0").count
  rep = rep.sort_by { |k, v| v }.reverse!

  rep.each do |e|
    puts "#{e.first}: 2 Senators, #{e.last} Representative(s)"
  end

end
# list_by_state_and_cm_count

def total_cm
  sen_count = CongressMember.where(title: "Sen").count
  rep_count = CongressMember.where(title: "Rep").count

  puts "Senators: #{sen_count}"
  puts "Representatives: #{rep_count}"
end

# total_cm

def delete_inactive_cm
  CongressMember.where(in_office: "0").destroy_all
end

# delete_inactive_cm
# total_cm

# p CongressMember.where.not(twitter_id: "").count
# Tweet.delete_all

