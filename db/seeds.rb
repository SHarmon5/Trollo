5.times do 
  List.create(
    name: Faker::Name.first_name,
    board_id: 1
  )
end