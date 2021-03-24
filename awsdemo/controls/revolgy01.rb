control 'Revolgy001: Scan Port for SSH' do
  impact 0.9
  title 'Server: Configure the service port'
  desc '
  Always specify which port the SSH server should listen to.
  Prevent unexpected settings.
  '
  describe sshd_config do
  its('Port') { should eq('22') }
  end
end

control 'Revolgy002: Application location check' do
  impact 0.8
  title 'Application main is located at app/main.js'
  desc '
  Your application must be located in app/main.js. 
  This is the main application directory and if this .js file is missing the deplomynet for staging and production will not work correctly.
  '
describe 'test file' do
  subject { file('/app/main.js') }
  it 'should be a file' do
    expect(subject).to(be_file)
  end
end
end


control 'Revolgy003: cis-dil-benchmark-4.2.1.1' do
  impact 0.5
  title 'Ensure rsyslog Service is insalled'
  desc  '
    The `rsyslog` software is a recommended replacement to the original `syslogd` daemon which provide
    improvements over `syslogd`, such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats,
    and the encryption of log data en route to a central logging server.
  '
  describe package('rsyslog') do
    it { should be_installed }
  end
end

control 'Revolgy004: Aide integrity monitoring is installed' do
  impact 0.3
  title 'Install check for aide packade'
  desc 'Advanced Intrusion Detection Environment (AIDE) is a utility that creates a database of files on the system, and then uses that database to ensure file integrity and detect system intrusions.'
  describe package('aide') do
    it { should be_installed }
  end
end
