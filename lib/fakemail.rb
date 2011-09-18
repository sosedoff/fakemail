require 'fileutils'

module Fakemail
  DEFAULT_PATH = '/tmp/fakemail'
  
  class << self
    # Set a new output path for emails
    #
    def output_path= (path)
      @output_path = path
    end
    
    # Get current emails output path
    #
    def output_path
      @output_path ||= DEFAULT_PATH
    end
  end
  
  class Mail
    # Initialize a mail with input
    #
    def initialize(stream=nil)
      headers = ''
      body = ''
      
      stream.each_line { |l| headers << l ; break if l.strip.empty? }
      stream.each_line { |l| body << l }
      
      format = headers =~ /text\/html/i ? 'html' : 'txt'
      filename = Time.now.to_i
      
      setup
      
      File.open("#{@dir}/#{filename}_headers.txt", "w") { |f| f.write(headers) }
      File.open("#{@dir}/#{filename}.#{format}", "w")   { |f| f.write(body) }
    end
    
    # Setup an output path
    #
    def setup
      @dir = Fakemail.output_path
      FileUtils.mkdir_p(@dir)
    end
  end
end