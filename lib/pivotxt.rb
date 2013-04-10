require 'treetop'
require 'pivotal-tracker'
require 'yaml'

class Pivotxt
  attr_reader :project

  def initialize(stories_file, config_file)
    @stories_file = stories_file
    @config = YAML.load_file(config_file)

    PivotalTracker::Client.token = @config['token']
    PivotalTracker::Client.use_ssl = @config['ssl'] == true
    @project = PivotalTracker::Project.find(@config['project_id'])
  end

  def load_stories
    grammar = File.join(File.dirname(__FILE__), 'pivtxt.treetop')
    Treetop.load grammar

    parser = PivtxtParser.new
    parser.consume_all_input = false
    tree = parser.parse(File.read(@stories_file).to_s)

    return tree.value
  end

  def upload_stories!
    labeled_groups = load_stories()
    labeled_groups.each do |labeled_group|
      labels = labeled_group[:labels]
      stories = labeled_group[:stories]
      stories.reverse.each do |story|
        title = story[:title].value
        description = story[:description].value
        @project.stories.create(:name => title, :description => description, :labels => labels, :story_type => story[:type].to_s)
      end
    end
  end
end
