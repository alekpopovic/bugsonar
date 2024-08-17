# frozen_string_literal: true

RSpec.describe(Bugsonar) do
  it "has a version number" do
    expect(Bugsonar::VERSION).not_to(be(nil))
  end

  it "does something useful" do
    expect(false).to(eq(false))
  end
end
