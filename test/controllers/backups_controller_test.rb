require "test_helper"

class BackupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create_backup" do
    get backups_create_backup_url
    assert_response :success
  end
end
