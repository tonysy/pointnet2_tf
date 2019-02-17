INCLUDE_PATH=$1
LIB_PATH=$2

# Build Grouping
cd ./grouping

/usr/local/cuda-8.0/bin/nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
# TF1.4
g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I ${INCLUDE_PATH} -I /usr/local/cuda-8.0/include -I ${INCLUDE_PATH}/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L${LIB_PATH} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

cd ..

# Build Interpolation
cd ./3d_interpolation
# TF1.4
g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I ${INCLUDE_PATH} -I /usr/local/cuda-8.0/include -I ${INCLUDE_PATH}/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L${LIB_PATH} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

cd ..

# Build Point Sift
# cd ./pointSIFT_op

# /usr/local/cuda-8.0/bin/nvcc pointSIFT.cu -o pointSIFT_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
# # TF1.4
# g++ -std=c++11 main.cpp pointSIFT_g.cu.o -o tf_pointSIFT_so.so -shared -fPIC -I ${INCLUDE_PATH} -I /usr/local/cuda-8.0/include -I ${INCLUDE_PATH}/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L${LIB_PATH} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# cd ..

# Build Sampling

cd ./sampling

/usr/local/cuda-8.0/bin/nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
# TF1.4
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I ${INCLUDE_PATH} -I /usr/local/cuda-8.0/include -I ${INCLUDE_PATH}/external/nsync/public -lcudart -L /usr/local/cuda-8.0/lib64/ -L${LIB_PATH} -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

cd ..

echo "Build Successfully!"