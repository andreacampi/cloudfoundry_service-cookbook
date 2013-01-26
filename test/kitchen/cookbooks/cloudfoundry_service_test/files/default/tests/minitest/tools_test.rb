require File.expand_path('../support/helpers', __FILE__)

describe 'cloudfoundry_service::tools' do
  include Helpers::CFService

  it 'creates an Upstart config file' do
    upstart_file = file('/etc/init/cloudfoundry-backup_manager.conf')
    upstart_file.with(:owner, 'root').with(:group, 'root')
    upstart_file.must_match %r{/srv/cloudfoundry/services/tools/tools/backup/manager/bin/backup_manager}
  end
end
