
require 'bench_press'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray vector sum'
author 'Clbustos'
date '2011-01-17'
summary "Compare sum of vectors between GSL and Narray"

reps 2000 #number of repetitions

samples=1000

a_int=samples.times.map {rand(255)}
b_int=samples.times.map {rand(255)}

a_float=samples.times.map {rand*1000}
b_float=samples.times.map {rand*1000}



a_int_gsl=GSL::Vector.alloc(a_int)
b_int_gsl=GSL::Vector.alloc(b_int)
a_float_gsl=GSL::Vector.alloc(a_float)
b_float_gsl=GSL::Vector.alloc(b_float)


a_int_narray=NArray.to_na(a_int)
b_int_narray=NArray.to_na(b_int)
a_float_narray=NArray.to_na(a_float)
b_float_narray=NArray.to_na(b_float)

measure "GSL::Vector sum with ints" do
  a_int_gsl+b_int_gsl+a_int_gsl+b_int_gsl
end

measure "GSL::Vector sum with floats" do
  a_float_gsl+b_float_gsl+a_float_gsl+b_float_gsl
end

measure "NArray sum with ints" do
  a_int_narray+b_int_narray+a_int_narray+b_int_narray
end

measure "NArray sum with floats" do
  a_float_narray+b_float_narray+a_float_narray+b_float_narray
end
