require 'spec_helper'
describe 'kvmcluster' do

  context 'with defaults for all parameters' do
    it { should contain_class('kvmcluster') }
  end
end
