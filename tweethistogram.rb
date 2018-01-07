require 'csv'
require 'time'
require 'tzinfo'

fil = ARGV[0]
stuff = Array []

tweets = CSV.read(fil)
tweets.each do |x|
  if x[1] != 'created_at' and x[3].start_with?('RT @') == false then
    times = Time.parse(x[1].to_s)
    shift = times.getlocal('-05:00')
    stuff << "#{shift.hour}:#{shift.min}:#{shift.sec}"
  end
end
puts stuff
