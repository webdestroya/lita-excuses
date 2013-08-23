require "spec_helper"

describe Lita::Handlers::Excuses, lita_handler: true do
  it { routes_command("excuse").to(:excuse) }
  it { routes("!excuse").to(:excuse) }
end
