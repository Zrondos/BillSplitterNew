string= "coke                      5.00

Sprite                    5.00
iced Tea                  4.00
Arnold Palmer             4.50
Dream Berry              18.00
Lobster Mashed Potatoes  35.00
Gnocchi                  30.00
sauteed Asparagus        12.00
Chocolate Sin Cake        9.00
warm Butter Cake         14.00
Ahi Tuna Entree          38.00
Cappuccino (2 @5.25)     10.50
Porterhouse 24oz         54.00
Bone In Ribeye 22oz      52.00
Ribeye Chop Chef Cut    59.00
Rack of Lamb             47.00
Subtotal                397.00
Tax                      30.77
Total                   427.77"

array=[]
string.each_line{|c| array.push(c)}

array.each do |s|
    s.gsub!(' ', '')
end

new_array=[]
numbers=["0","1","2","3","4","5","6","7","8","9"]
array.each do |element|
    for i in 0..element.length
        if numbers.include?(element[i])
            item=element[0..(i-1)]
            price=element[i..-1]
            # puts item
            # puts price
            break
        end
    end
    new_array.push([item,price])
end
puts new_array.to_s
# puts new_array.to_s

#     for i in 0..5
#         puts "Value of local variable is #{i}"
#      end
# puts string.split("/n").to_s