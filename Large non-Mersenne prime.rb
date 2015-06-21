# https://projecteuler.net/problem=97
# (x + y) % d = ((x % d) + (y % d)) % d 
# (x * y) % d = ((x % d) * (y % d)) % d

def mod(base, exponent, divisor)

  power, remainder = 1, base % divisor 
  cache = []
  
  while power <= exponent
    cache << [power, remainder]
    power <<= 1
    remainder = (remainder * remainder) % divisor
  end 

  power, remainder = cache.pop

  while !cache.empty?
    power_cache, remainder_cache = cache.pop
    if power_cache + power <= exponent
      remainder = (remainder * remainder_cache) % divisor
      power += power_cache
    end  
  end
  
  remainder
end 

base, exponent, divisor = STDIN.read.split.map(&:to_i)
(28433 * mod(base, exponent, divisor) + 1) % divisor
