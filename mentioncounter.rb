require 'csv'

num = ARGV[1].to_i
fil = ARGV[0]

tweets = CSV.read(fil+"_tweets.csv")
tweets = tweets.to_s.scan(/@\w+/)
counts = Hash.new 0
tweets.each { |word| counts[word] += 1 }
lesser = counts.select { |k,v| v > num }.sort_by { |k,v| v }.reverse
lesser = lesser.reject { |k,v| k =~ /#{fil}/ }
lesser.each { |a,b| print "@#{fil}, ",a,", ",b,"\n"  }
