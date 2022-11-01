# Add seed data in this file
puts "Seeding spells..."
#spells we want to add to db
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]
#iterate over each spell
spells.each do |spell|
    #make request to end point
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
    #use JSON.parse to convert string to ruby hash
    spell_hash = JSON.parse(response)
    #create a spell in db using data from this hash
    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
    )
end
puts "Done seeding!"