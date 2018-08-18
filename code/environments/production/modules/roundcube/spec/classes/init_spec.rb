require 'spec_helper'
describe 'roundcube' do
  context 'with default values for all parameters' do
    it { should contain_class('roundcube') }
  end
end
