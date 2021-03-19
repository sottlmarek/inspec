control 'Revolgy001: Scan Port' do
    impact 10.0
    title 'Server: Configure the service port'
    desc 'Always specify which port the SSH server should listen to.
    Prevent unexpected settings.'
    describe sshd_config do
    its('Port') { should eq('22') }
    end
end

control 'Revolgy003: Application location' do
    impact 10.0
    title 'Check the binary of the application'
    desc 'Your application must be located in app/main.js'
  describe 'test file' do
    subject { file('/app/main.js') }
    it 'should be a file' do
      expect(subject).to(be_file)
    end
  end
end
