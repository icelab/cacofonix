$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'cacofonix'

#reader = Cacofonix::Reader.new(File.join(File.dirname(__FILE__),"..","data","Bookwise_July_2008.xml"), ::Cacofonix::APAProduct)
#reader = Cacofonix::Reader.new(File.join(File.dirname(__FILE__),"..","data","Ashgate Other.xml"), ::Cacofonix::APAProduct)
#reader = Cacofonix::Reader.new(File.join(File.dirname(__FILE__),"..","data","9780194351898.xml"), ::Cacofonix::APAProduct)
reader = Cacofonix::Reader.new(File.join(File.dirname(__FILE__),"..","data","jul.xml"), ::Cacofonix::APAProduct)
#reader = Cacofonix::Reader.new(File.join(File.dirname(__FILE__),"..","data","rba_FANT.xml"))
counter = 0

# display header info
puts reader.header.from_company

reader.each do |item|
  puts "#{item.record_reference} - #{item.cover_url}"
  puts item.title
  puts
  counter += 1
end

puts "total of ##{counter} products"
