require "dotenv"
require "sequel"

Dotenv.load

Sequel::Model.plugin :timestamps

module Yakscart
  DB = Sequel.connect(ENV.fetch("DATABASE_URL"))
end
