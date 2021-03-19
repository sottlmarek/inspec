control 'Revolgy001: Scan Port' do
    impact 0.9
    title 'Server: Configure the service port'
    desc 'Always specify which port the SSH server should listen to.
    Prevent unexpected settings.'
    describe sshd_config do
    its('Port') { should eq('22') }
    end
end

control 'Revolgy002: Application location' do
    impact 0.8
    title 'Application main is located at app/main.js'
    desc 'Your application must be located in app/main.js'
  describe 'test file' do
    subject { file('/app/main.js') }
    it 'should be a file' do
      expect(subject).to(be_file)
    end
  end
end

control 'Revolgy003: EC2 name' do
    impact 0.8
    title 'Name of the EC2 instance'
    desc 'EC2 should be named SecTech'
describe aws_ec2_instance(name: 'SecTech') do
  it { should exist }
end
