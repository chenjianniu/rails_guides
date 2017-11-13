class DataLockView < ApplicationRecord
	self.table_name = :data_lock_views
	self.locking_column = :lock_version_same
end
