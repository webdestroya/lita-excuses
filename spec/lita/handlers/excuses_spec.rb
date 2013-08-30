require "spec_helper"

describe Lita::Handlers::Excuses, lita_handler: true do
  it { routes_command("excuse").to(:excuse) }

  it "tests an excuse" do
    send_command("excuse")
    expect(replies.last).to_not eq("Sorry, I was unable to come up with a good excuse for you.")
  end
end
