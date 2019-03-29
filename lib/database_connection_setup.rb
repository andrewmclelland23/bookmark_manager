require_relative 'database_connection'

ENV['ENVIRONMENT'] == 'test' ? env = 'bookmark_manager_test' : env = 'bookmark_manager'
DatabaseConnection.setup(env)
