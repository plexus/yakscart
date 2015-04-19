require "pathname"

ROOT = Pathname(__FILE__).dirname.parent

$LOAD_PATH.unshift ROOT.join("lib")

require_relative "../config/environment"
require "yakscart"

RSpec.configure do |rspec|
  rspec.backtrace_exclusion_patterns = [] if ENV['FULLSTACK']
  rspec.disable_monkey_patching!
  rspec.raise_errors_for_deprecations!
end

RSpec.shared_context 'yaks context' do
  let(:policy)            { Yaks::DefaultPolicy.new }
  let(:rack_env)          { {} }
  let(:mapper_stack)      { [] }
  let(:yaks_context)      { { policy: policy, env: rack_env, mapper_stack: mapper_stack } }
end
