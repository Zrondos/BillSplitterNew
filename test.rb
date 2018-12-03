def split(string)
    item_price_pairs=[]
    numbers=["0","1","2","3","4","5","6","7","8","9","."]
    item_info=""
    price=""
    string_indicies=(0...string.length)
    string_indicies.reverse_each do |index|
        if numbers.include?(string[index])
            next
        end
        item_info=string[0..index]
        price=string[index+1..-1]
        break 
    end
    quantity=""
    item_name=""
    index_of_last_digit=-1
    for i in (0...item_info.length).to_a
        if  not numbers.include?(item_info[i])
            item_name=item_info[(index_of_last_digit+1)..-1]
            break
        end
        quantity+=item_info[i]
        index_of_last_digit=i
    end
    item_capitalized=""
    for index in (0...item_name.length).to_a
        to_add=item_name[index]
        if item_name[index]==item_name[index].upcase && index!=0
            to_add=" "+item_name[index]
        end
        item_capitalized+=to_add
    end

    quantity.gsub!(' ', '')
    quantity=quantity.to_i
    if quantity==0
        quantity=1
    end
    price=price.to_i
    price_per=price/quantity
    # puts price_per

    for i in 0...quantity
        item_price_pairs.push([item_capitalized,price_per])
    end

    puts item_price_pairs.to_s
    
end

split("25GoodSteak22oz10.00")