require './method'

    class Array
  def sum
    reduce(:+)
  end
 
  def mean
    sum.to_f / size
  end
 
  def var
    m = mean
    reduce(0) { |a,b| a + (b - m) ** 2 } / (size - 1)
  end
 
  def sd
    Math.sqrt(var)
  end
  
  
    end
 
nums = [] #値段を入れる配列作成
averages = []  #平均を入れる配列作成
num = get_price
current_price = get_price
while(true) #無限ループ開始
  nums.push(num)
  num = get_price
  current_price = get_price
  if nums.length > 60
    nums.shift #shiftメソッドで古いものを削除
    standard_deviation = nums.sd
    lowprice=100000000000 
    bsedprice = 825
    for i in 1..60
       
            total = 0.0
        nums.each{|i| total += get_price}
        average= total / nums.size
       
      trendbunsi = (get_price - average)*( i - 30.5)
      trendbunbo = ((i - 30.5)*(i - 30.5))
      trend = trendbunsi / trendbunbo
        lowprice=100000000000
        if (get_my_money("BTC")["amount"]>=0.001)&&(bsedprice*1.068 < current_price)&&(trend<-10)
        puts "売る"
        order("SELL",current_price,0.001)
        bsedprice = current_price/1000
        elsif(get_my_money("JPY")["amount"]>500)&&(bsedprice*1.068 > current_price)&&(trend>50)
        puts"買う"
        order("BUY",current_price,0.001)
        bsedprice = current_price/1000
      else
        puts"."
        end  
    end
     #過去の最安値を持ってくる
    end  
end
