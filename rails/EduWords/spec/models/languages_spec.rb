require "spec_helper"

describe Language do
  it "create test language" do
    a = Language.create!(name: "Angielski", member_id: "1")
    b = Language.create!(name: "Niemiecki", member_id: "1")
    c = Language.create!(name: "Hiszpanski", member_id: "1")
    d = Language.create!(name: "Deutsch", member_id: "1")
  
  end
end