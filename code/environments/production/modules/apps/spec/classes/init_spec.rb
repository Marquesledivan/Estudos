require 'spec_helper'
describe 'apps' do
  context 'with default values for all parameters' do
    it { should contain_class('apps') }
  end
end
