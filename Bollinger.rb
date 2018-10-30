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
num = get_price
current_price = get_price
while(true) #無限ループ開始
  nums.push(num)
  num = get_price
  current_price = get_price
  if nums.length > 300
    nums.shift #shiftメソッドで古いものを削除
    average = nums.mean
    standard_deviation = nums.sd
    sigumapulus=average + 3*(standard_deviation)
    sigumamainasu= average - 3*(standard_deviation)
    #puts "平均:" + average.to_s
    #puts "標準偏差:" + standard_deviation.to_s
    #puts "平均＋シグマ" 
    #puts sigumapulus
    #puts "平均-シグマ"
    #puts sigumamainasu
    
    #puts "手持ちのBTC"
    #puts get_my_money("BTC")["amount"]
    #puts "手持ちのJPY"
    #puts get_my_money("JPY")["amount"]
    if current_price
       #puts "現在の価格"
       #puts current_price
      if(current_price > sigumapulus)&&(get_my_money("BTC")["amount"]>=0.001)
        puts "上側0.03％の出来事"
        order("SELL",current_price,0.001)
      elsif(current_price < sigumamainasu)&&(get_my_money("JPY")["amount"]>500)
        puts"下側0.03%の出来事"
        order("BUY",current_price,0.001)
      else
        puts"〇"
      end
    sleep 1
    end
  end
end
