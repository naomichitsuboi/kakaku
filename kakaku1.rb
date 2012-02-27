require 'open-uri'

apikey = "011901e8365d251f7d90fef68a64a98f"

print "input keyword\n"

keyword = STDIN.gets.chomp
open("http://api.kakaku.com/WebAPI/ItemSearch/Ver1.0/ItemSearch.aspx?Keyword=#{keyword}&ApiKey=#{apikey}"){|fp|fp.each{|line|print line}}
