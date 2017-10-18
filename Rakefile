require 'bundler/setup'
Bundler.require

DB = Sequel.connect('postgres://db/app?user=postgres')

namespace :db do
  task :create do
    DB.create_table :posts do
      primary_key :id
      column :title, String
      String :content
      index :title
    end
  end
end
