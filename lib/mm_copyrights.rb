#- Copyright 2008 8th Light, Inc.
#- Limelight and all included source files are distributed under terms of the GNU LGPL.

module MM
  module Copyrights
    
    class <<self
      attr_accessor :verbose
    end
    
    self.verbose = true

    ENDL = $/

    class SourceFile

      attr_reader :copyright

      def initialize(filename, comment_prefix)
        @filename = filename
        @comment_prefix = comment_prefix
        @lines = IO.readlines(filename, ENDL)
        find_copyright
      end

      def has_copyright?
        @copyright.length > 0
      end

      def find_copyright
        @copyright = ''
        @lines.each do |line|
          if has_comment_prefix(line)
            @copyright << line[@comment_prefix.length..-1]
          else
            break
          end
        end
        @copyright.strip!
      end

      def has_comment_prefix(line)
        return false if line.nil?
        return line[0...@comment_prefix.length] == @comment_prefix
      end

      def remove_copyright
        while has_comment_prefix(@lines[0])
          @lines.shift
        end
      end

      def add_copyright(text)
        @lines.insert(0, ENDL) if @lines[0].to_s.strip.length > 0
        @lines.insert(0, ENDL)
        text.split(/^/).reverse.each do |line|
          @lines.insert(0, "#{@comment_prefix} #{line}")
        end
      end

      def save!
        File.open(@filename, "w") do |file|
           @lines.each do |line|
             file.write line
           end
        end
      end
    end
    
    def self.process(dir, ext, prefix, copyright)
      Dir.glob(File.join(dir, "**", "*.#{ext}")).each do |filename|
        source_file = SourceFile.new(filename, prefix)
        if source_file.has_copyright?
          if source_file.copyright != copyright
            say "invalid copyright: #{filename}"
            source_file.remove_copyright
            source_file.add_copyright(copyright)
            source_file.save!
          else
            say "already has valid copyright: #{filename}"
          end
        else
          say "missing copyright: #{filename}"
          source_file.add_copyright(copyright)
          source_file.save!
        end
      end
    end
    
    def self.say(thing)
      puts thing if @verbose
    end

  end
end