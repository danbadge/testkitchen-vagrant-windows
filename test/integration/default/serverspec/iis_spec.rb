require 'net/http'

require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'should have IIS installed and running' do
	describe package('iis') do
		it { should be_installed }
	end

	describe service('iis') do
		it { should be_enabled }
		it { should be_running }
	end

	describe port(80) do
		it { should be_listening }
	end
end