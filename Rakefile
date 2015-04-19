require "pathname"

ROOT = Pathname(__FILE__).dirname

$LOAD_PATH.unshift ROOT.join("lib")

require_relative "config/environment"
require "yakscart"

namespace :db do
  desc "Run migrations"

  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(Yakscart::DB, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(Yakscart::DB, "db/migrations")
    end
  end

  task :load_demo_data do
    require "yaml"
    Pathname.glob(ROOT.join("db/demo/*.yml")).each do |file|
      table = file.basename(file.extname).to_s.to_sym
      YAML.load(file.read).each do |record|
        Yakscart::DB[table].insert(record)
      end
    end
  end
end

task :console do
  require "pry"
  ARGV.clear
  Pry.start
end
