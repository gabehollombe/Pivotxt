require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Pivotxt do
  before do
    stories_file = File.join(File.dirname(__FILE__), 'fixtures', 'pivotxt_stories.txt')
    config_file = File.join(File.dirname(__FILE__), '..', 'pivotxt_config.yml')

    PivotalTracker::Project.stub!(:find).and_return(PivotalTracker::Project.new)
    @pivotxt = Pivotxt.new(stories_file, config_file)
  end

  it 'sets the pivotal project as configured' do
    @pivotxt.project.should be_a_kind_of(PivotalTracker::Project)
  end

  describe '#load_stories(file)' do
    before do
      @label_groups = @pivotxt.load_stories
    end

    it 'returns label_groups' do
      @label_groups.length.should == 2
    end
  end

  describe "#upload_stories!" do
    it 'creates a story of the appropriate type with the appropriate labels' do
      mock = double
      mock.should_receive(:create).exactly(6).times
      @pivotxt.project.stub(:stories).and_return(mock)
      @pivotxt.upload_stories!
    end
  end
end
