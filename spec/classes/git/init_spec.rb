require 'spec_helper'

describe 'git' do
  describe 'operating system is Ubuntu' do
    describe 'release is Lucid' do
      let(:facts) { { :operatingsystem => 'Ubuntu', :operatingsystemrelease => 'Lucid' } }
      it 'should include git-core' do
        should contain_package('git-core')
      end
    end  

    describe 'release is Saucy' do
      let(:facts) { { :operatingsystem => 'Ubuntu', :operatingsystemrelease => 'Saucy' } }
      it 'should include git' do
        should contain_package('git')
      end
    end
  end

  describe 'operating system is CentOS' do
    let(:facts) { { :operatingsystem => 'CentOS' } }
    it 'should include git' do
      should contain_package('git')
    end
  end

  describe 'operating system is MINIX' do
    let(:facts) { { :operatingsystem => 'MINIX'} }

    it do
      expect {
        should contain_package('git')
      }.to raise_error(Puppet::Error, /No git package known for operating system MINIX/)
    end
  end
end
