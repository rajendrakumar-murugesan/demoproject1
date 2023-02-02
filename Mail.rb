
require 'byebug'
require 'pry'
class Mailer

  def self.deliver(&block)
    # debugger
    debugger
    # binding.pry
    mail = MailBuilder.new(&block).mail
    mail.send_mail
  end

  Mail = Struct.new(:from, :to, :subject, :body, :hola) do 
    def send_mail
      debugger
      fib(30)
      puts "Email from: #{from}"
      puts "Email to  : #{to}"
      puts "Subject   : #{subject}"
      puts "Body      : #{body}"
      puts "Hola      : #{hola}"
    end

    def fib(n)
      n < 2 ? n : fib(n-1) + fib(n-2)
    end  
  end

  class MailBuilder
    def initialize(&block)
      debugger
      @mail = Mail.new
      instance_eval(&block)
    end
    
    attr_reader :mail
    
    %w(from to subject body hola).each do |m|
      define_method(m) do |val|
        debugger
        @mail.send("#{m}=", val)
      end
    end
  end
end


Mailer.deliver do 
  from    "eki@eqbalq.com"
  to      "jill@example.com"
  subject "Threading and Forking"
  body    "Some content"
  hola    "abother val"
end