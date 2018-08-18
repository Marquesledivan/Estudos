require 'spec_helper'
describe 'loganalyzer' do
  context 'with default values for all parameters' do
    it { should contain_class('loganalyzer') }
  end
end
