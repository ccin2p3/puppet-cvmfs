require 'spec_helper'

os_fixtures = @os_fixtures

describe 'cvmfs::foo' do
  context 'supported operating systems' do
    os_fixtures.each do |osname, osfixtures|
      describe "without any parameters" do
        let(:params) {{ }}
        describe "on #{osname}" do
          let(:facts) do
            osfixtures[:facts]
          end
          it { should compile.with_all_deps }
          it { should contain_class('cvmfs::foo') }
          it { should contain_class('cvmfs::foo::params') }
          it { should contain_class('cvmfs::foo::config') }
          it { should contain_class('cvmfs::foo::install').that_comes_before('cvmfs::foo::config') }
          it { should contain_class('cvmfs::foo::service').that_subscribes_to('cvmfs::foo::config') }
        end
      end
    end
  end
end

# vim: ft=ruby
