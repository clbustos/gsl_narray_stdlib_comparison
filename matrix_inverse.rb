
require 'bench_press'
require 'matrix'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray matrix inverse'
author 'Clbustos'
date '2011-01-17'
summary "Compare GSL and NMatrix inverse"

reps 2000 #number of repetitions

size=10
gsl=GSL::Matrix.alloc(size,size)
size.times {|i| size.times {|j| gsl[i,j]=rand*100}}
narray=NMatrix.float(size,size)
size.times {|i| size.times {|j| narray[j,i]=rand*100}}

ruby=::Matrix.build(size,size) {rand*100}



measure "GSL::Linalg::LU.invert()" do
GSL::Linalg::LU.invert(gsl)
end

measure "NMatrix.inverse" do
	narray.inverse
end

#measure "std.lib Matrix.inverse" do
#	ruby.inverse
#end
