
require 'bench_press'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray vector from array'
author 'Clbustos'
date '2011-01-17'
summary "Creating an GSL or Narray from an array"

reps 1000 #number of repetitions

samples=1000
ary=samples.times.map {rand}

measure "GSL::Vector#alloc(ary)" do
  gsl=GSL::Vector.alloc(ary)
end

measure "NArray.to_a(ary)" do
  narray=NArray.to_na(ary)
end
