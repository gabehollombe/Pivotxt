$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruby-debug'
require 'treetop'
require 'pivotal-tracker'
require 'pivotxt'

require 'fakeweb'
FakeWeb.allow_net_connect = false
