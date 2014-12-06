require "spec_helper"

describe Tag do
  it "create test tag" do
    a = Tag.create!(name: "Sport", member_id: "1")
    b = Tag.create!(name: "Motoryzacja", member_id: "1")
    c = Tag.create!(name: "Nauka", member_id: "1")
    d = Tag.create!(name: "Przyroda", member_id: "1")
  
  end
end