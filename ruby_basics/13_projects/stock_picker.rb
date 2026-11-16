def stock_picker(stocks)
  largest_diff = 0
  buy = 0
  sell = 0

  #puts "hello"
  (0...stocks.length).each do |start_day|
    (start_day...stocks.length).each do |sell_day|
      #puts "sell day: %d" % stocks[sell_day]
      current_diff = stocks[sell_day] - stocks[start_day]
      if current_diff > largest_diff
        largest_diff = current_diff
        buy = start_day
        sell = sell_day
      end
    end
    #puts "start day: %d" % stocks[start_day]
  end
  #puts "Best days to buy and sell: %d and %d" % [buy, sell]
  puts [buy,sell]
end

stock_picker([17,3,6,9,15,8,6,1,10])
