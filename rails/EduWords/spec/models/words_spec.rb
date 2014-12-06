require "spec_helper"

describe Word do
  it "create test tag" do
    a = Word.create!(namelanguage1: "test", namelanguage2: "test", member_id: '10', language1_id: '3', language2_id: '3')
    b = Word.create!(namelanguage1: "pierwszy", namelanguage2: "jakis", member_id: '14', language1_id: '4', language2_id: '13')
    c = Word.create!(namelanguage1: "trzeci", namelanguage2: "taki", member_id: '2', language1_id: '5', language2_id: '34')
    d = Word.create!(namelanguage1: "czwarty", namelanguage2: "test", member_id: '3', language1_id: '7', language2_id: '32')
  end
end