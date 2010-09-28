require 'spec_helper'

describe 'the pivotxt treetop grammar' do
  before do
    grammar = File.join(File.dirname(__FILE__), '..', 'lib', 'pivtxt.treetop')
    Treetop.load grammar
    
    @parser = PivtxtParser.new
    @parser.consume_all_input = false
  end
  
  it 'parses an example stories file' do
    stories_file = File.join(File.dirname(__FILE__), 'fixtures', 'pivotxt_stories.txt')
    tree = @parser.parse(File.read(stories_file).to_s)
    print "FAILURE REASON: " + @parser.failure_reason.to_s if ! tree


    label_groups = tree.value

    labels = label_groups.first[:labels]
    labels.should include('LabelOne', 'LabelTwo')
    
    stories = label_groups.first[:stories]
    stories.length.should == 5


    stories[0][:title].value.should == "feature one "
    stories[0][:description].value.should == "(description one)"
    stories[0][:type].should == :feature

    multi_line_desc = stories[2][:description].value
    multi_line_desc.should include('desc line 1', 'desc line 2', 'desc line 3')

    stories[3][:type].should == :chore
    stories[3][:title].value.should == "chore one "
    stories[3][:description].value.should == "(chore desc one)"


    #next label group
    stories = label_groups[1][:stories]
    stories.length.should == 1
    label_groups[1][:labels].should include('LabelThree')
  end
end
