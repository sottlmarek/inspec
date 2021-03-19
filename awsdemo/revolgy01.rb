control 'Revolgy001: Scan Port' do
    impact 10.0
    title 'Server: Configure the service port'
    desc 'Always specify which port the SSH server should listen to.
    Prevent unexpected settings.'
    describe sshd_config do
    its('Port') { should eq('22') }
    end
end

control 'Revolgy002: os-02' do
    impact 3.0
    title 'Check owner and permissions for /etc/shadow'
    desc 'Check periodically the owner and permissions for /etc/shadow'
    describe file('/etc/shadow') do
      it { should exist }
      it { should be_file }
      it { should be_owned_by 'root' }
      its('group') { should eq shadow_group }
      it { should_not be_executable }
      it { should_not be_readable.by('other') }
    end
    if os.redhat? || os.name == 'fedora'
      describe file('/etc/shadow') do
        it { should_not be_writable.by('owner') }
        it { should_not be_readable.by('owner') }
      end
    else
      describe file('/etc/shadow') do
        it { should be_writable.by('owner') }
        it { should be_readable.by('owner') }
      end
    end
    if os.debian? || os.suse?
      describe file('/etc/shadow') do
        it { should be_readable.by('group') }
      end
    else
      describe file('/etc/shadow') do
        it { should_not be_readable.by('group') }
      end
    end
  end
