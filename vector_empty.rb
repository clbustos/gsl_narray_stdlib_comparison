
require 'bench_press'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray empty vector'
author 'Clbustos'
date '2011-01-17'
summary "Creating an empty vector of size 10000"

reps 2000 #number of repetitions

size=10000

measure "NArray.int(size)" do
  narray=NArray.int(size)
end

measure "NArray.sfloat(size)" do
  narray=NArray.sfloat(size)
end


measure "NArray.float(size)" do
  narray=NArray.float(size)
end




measure "GSL::Vector#alloc(size)" do
  gsl=GSL::Vector.alloc(size)
end

