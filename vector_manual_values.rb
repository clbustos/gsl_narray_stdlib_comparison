
require 'bench_press'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray vector with defined values'
author 'Clbustos'
date '2011-01-17'
summary "Creating a vector"

reps 10000 #number of repetitions


measure "NArray[] with ints" do
  narray=NArray[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
end

measure "NArray[] with floats" do
  narray=NArray[1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5, 11.5,12.5,13.5,14.5,15.5,16.5,17.5,18.5,19.5,20.5]
end

measure "GSL::Vector[] with ints" do
  gsl=GSL::Vector[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
end

measure "GSL::Vector[] with floats" do
  narray=GSL::Vector[1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5, 11.5,12.5,13.5,14.5,15.5,16.5,17.5,18.5,19.5,20.5]
end
