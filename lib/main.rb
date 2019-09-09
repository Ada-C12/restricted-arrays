# require 'pry'
# def make_room()
#   TOTAL_ROOMS.times do |index|
#     room = Room.new(id: index + 1, number: index + 1, availability: true, reservation: nil)
#     @rooms << room
#     binding.pry
#   end
# end

array = [1, 2, 3, 4]
i = 0
largest_value = 0
# element = 0
while array[i] > array[i + 1]
  largest_value = array[i + 1]
  i += 1

end
p largest_value