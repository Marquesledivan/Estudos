require 'spec_helper'
describe 'bashrc' do
  context 'with default values for all parameters' do
    it { should contain_class('bashrc') }
  end
end
