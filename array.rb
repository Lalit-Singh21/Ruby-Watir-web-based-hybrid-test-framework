squares = [[1,1], [2,4], [3,9]]
for i in 0..2
  for j in 0..1
    puts squares[i][j]
  end
  end
	results = Hash.new
	squares.each { |k,v| results[k] = v }
	       
 results.each {|key, value| puts "#{key} is #{value}" }  
 
 square1="this@perl"
 data=square1.split('@')
 puts data[0]