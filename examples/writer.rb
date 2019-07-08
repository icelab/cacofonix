$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'cacofonix'

File.open('output.xml', "w") do |output|
  header = Cacofonix::Header.new
  header.from_company = "Sample Company"
  header.from_person  = "James"

  writer = Cacofonix::Writer.new(output, header)

  writer.end_document
end
