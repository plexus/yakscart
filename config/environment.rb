require "dotenv"
require "sequel"

Dotenv.load


module Yakscart
  DB = Sequel.connect(ENV.fetch("DATABASE_URL"))
end
