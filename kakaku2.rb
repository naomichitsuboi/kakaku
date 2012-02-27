#!ruby -Ks
require 'open-uri'
require 'rexml/document'
require 'csv'
require 'kconv'

apikey = "011901e8365d251f7d90fef68a64a98f"
print "input keyword\n"
keyword = STDIN.gets.chomp

rslt = open("http://api.kakaku.com/WebAPI/ItemSearch/Ver1.0/ItemSearch.aspx?Keyword=#{keyword}&ApiKey=#{apikey}&Charset=utf8")

doc = REXML::Document.new(rslt)

pnameary = Array.new();
mknameary = Array.new();
minpriceary = Array.new();

doc.elements.each("ProductInfo/Item/ProductName"){|proname| pnameary << proname.text}

doc.elements.each("ProductInfo/Item/MakerName"){|mkname| mknameary << mkname.text}

doc.elements.each("ProductInfo/Item/LowestPrice"){|mprice| minpriceary << mprice.text}

puts pnameary + mknameary + minpriceary

CSV.open("test.csv", "w:Shift_JIS:UTF-8") do |writer|
  writer << pnameary
  writer << mknameary
  writer << minpriceary
end

