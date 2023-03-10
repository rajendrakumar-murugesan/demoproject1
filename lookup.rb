# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
def get_command_line_argument  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
  puts "Usage: ruby lookup.rb <domain>"
  exit
end
ARGV.first
end

dns_raw = File.readlines("data.txt")

def parse_dns(dns_raw)
  dns = {}
  dns_raw.each do |line|
    val = line.split(",")
    dns[val[1].chomp.strip] = val[2].chomp.strip
  end
  dns
end

def resolve(dns_records, lookup_chain, domain)
  # puts dns_records
  # return dns_records.to_a if dns_records
  lookup_chain.push(dns_records[domain])
  if dns_records.include?(domain) &&  !dns_records.include?(dns_records[domain])
    return lookup_chain
  else
    resolve(dns_records, lookup_chain, dns_records[domain])
  end
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument
# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines

dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.to_a.to_h
puts lookup_chain.join(" => ")
