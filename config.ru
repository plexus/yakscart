require "pathname"

$LOAD_PATH.unshift Pathname(__FILE__).dirname.join("lib")

require_relative "config/environment"
require "yakscart"

run Yakscart::Application
