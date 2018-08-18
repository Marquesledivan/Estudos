require 'spec_helper'
describe 'logclient' do
  context 'with default values for all parameters' do
    it { should contain_class('logclient') }
  end
end
