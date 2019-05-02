#generate random stock prices 10 digits long $1-$20

stock_prices =Array.new(10){rand(1..20)}

print "the stock prices are #{stock_prices}"
puts

def stock_picker(stock_prices)
	add = 0
	while true
		high = stock_prices.max
		low = stock_prices.min
		if (stock_prices.index(low) < stock_prices.index(high))
			return [stock_prices.index(low).to_i + add, stock_prices.index(high).to_i + add]
		
		elsif stock_prices.index(low) == -1
			stock_prices.pop 

		elsif stock_prices.index(high) == 0
			stock_prices.shift 
			add += 1

		else 
			first_set = stock_prices[0..stock_prices.index(high)]
			second_set = stock_prices[stock_prices.index(low)..-1]
			if (first_set.max - first_set.min) > (second_set.max - second_set.min)
				best_buy_price = first_set.min
				best_sell_prices = first_set.max
			else
				best_buy_price = second_set.min
				best_sell_prices = second_set.max
			end
			return [stock_prices.index(best_buy_price + add), stock_prices.index(best_sell_prices + add)]
		end
	end
end

puts stock_picker(stock_prices)	