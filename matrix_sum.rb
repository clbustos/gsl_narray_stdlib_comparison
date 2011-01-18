
require 'bench_press'
require 'matrix'
require 'gsl'
require 'narray'

extend BenchPress

name 'GSL vs. Narray matrix sum'
author 'Clbustos'
date '2011-01-17'
summary "Compare sum of matrix between GSL and Narray"

reps 2000 #number of repetitions

size=30
n_mat=10
ruby=[]
gsl=[]
narray=[]
n_mat.times {|n|

gsl[n]=GSL::Matrix.alloc(size,size)
size.times {|i| size.times {|j| gsl[n][i,j]=rand*100}}
narray[n]=NArray.float(size,size)
size.times {|i| size.times {|j| narray[n][j,i]=rand*100}}

ruby[n]=::Matrix.build(size,size) {rand*100}

}


measure "GSL::Matrix sum" do
  n_mat.times.inject(GSL::Matrix.alloc(size,size)) {|ac,v| ac+gsl[v]}
end

measure "Narray sum" do
  n_mat.times.inject(NArray.float(size,size)) {|ac,v| ac+narray[v]}
end

#measure "std.lib Matrix sum" do
 # n_mat.times.inject(::Matrix.zero(size)) {|ac,v| ac+ruby[v]}
#end
