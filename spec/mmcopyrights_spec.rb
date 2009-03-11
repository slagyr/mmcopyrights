require 'rubygems'
require 'spec'
require File.expand_path(File.dirname(__FILE__) + "/../lib/mmcopyrights")
require 'fileutils'

TEST_DATA = File.expand_path(File.dirname(__FILE__) + "/../test_data")
SAMPLE = File.expand_path(File.dirname(__FILE__) + "/../sample")

describe MM::Copyrights do

  before(:each) do
    MM::Copyrights.verbose = false
    FileUtils.rm_rf(TEST_DATA) if File.exist?(TEST_DATA)
    FileUtils.cp_r(SAMPLE, TEST_DATA)
  end
  
  def check_file(file, headers)
    lines = IO.readlines(File.join(TEST_DATA, file))
    headers.each do |header|
      lines.shift.strip.should == header
    end
    original_lines = IO.readlines(File.join(SAMPLE, file))
    lines.should == original_lines
  end
  
  it "should copyright all the ruby files" do
    MM::Copyrights.process(TEST_DATA, "rb", "#-", "A simple copyright\nAll rights reserved")
    
    check_file("root.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("one/one.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("two/two.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("one/one_child/one_child.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    
    check_file("root.java", [])
    check_file("one/one.java", [])
    check_file("two/two.java", [])
    check_file("one/one_child/oneChild.java", [])
  end
  
  it "should copyright all the java files" do
    MM::Copyrights.process(TEST_DATA, "java", "//-", "A java copyright\nAll rights reserved")
    
    check_file("root.rb", [])
    check_file("one/one.rb", [])
    check_file("two/two.rb", [])
    check_file("one/one_child/one_child.rb", [])
    
    check_file("root.java", ["//- A java copyright", "//- All rights reserved", ""])
    check_file("one/one.java", ["//- A java copyright", "//- All rights reserved", ""])
    check_file("two/two.java", ["//- A java copyright", "//- All rights reserved", ""])
    check_file("one/one_child/oneChild.java", ["//- A java copyright", "//- All rights reserved", ""])
  end
  
  it "should update existing copyrights" do
    MM::Copyrights.process(TEST_DATA, "java", "//-", "Old copyright\nNo rights reserved")
    MM::Copyrights.process(TEST_DATA, "java", "//-", "New copyright\nAll rights reserved")
    
    check_file("root.java", ["//- New copyright", "//- All rights reserved", ""])
    check_file("one/one.java", ["//- New copyright", "//- All rights reserved", ""])
    check_file("two/two.java", ["//- New copyright", "//- All rights reserved", ""])
    check_file("one/one_child/oneChild.java", ["//- New copyright", "//- All rights reserved", ""])
  end
  
  it "should not change valid copy right" do
    MM::Copyrights.process(TEST_DATA, "rb", "#-", "A simple copyright\nAll rights reserved")
    MM::Copyrights.process(TEST_DATA, "rb", "#-", "A simple copyright\nAll rights reserved")
    
    check_file("root.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("one/one.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("two/two.rb", ["#- A simple copyright", "#- All rights reserved", ""])
    check_file("one/one_child/one_child.rb", ["#- A simple copyright", "#- All rights reserved", ""])
  end

end