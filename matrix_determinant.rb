
require 'bench_press'
require 'matrix'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Ruby matrix determinant'
author 'Clbustos'
date '2011-01-17'
summary "Compare GSL and Ruby matrix determinant"

reps 200 #number of repetitions

size=10
gsl=GSL::Matrix.alloc(size,size)
size.times {|i| size.times {|j| gsl[i,j]=rand*100}}
#narray=NMatrix.float(size,size)
#size.times {|i| size.times {|j| narray[j,i]=rand*100}}
ruby=::Matrix.build(size,size) {rand*1000}



measure "GSL::Matrix#det" do
gsl.det
end

measure "::Matrix.determinant" do
	ruby.determinant
end

#measure "std.lib Matrix.inverse" do
#	ruby.inverse
#end
