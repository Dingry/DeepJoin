# Make libs
if [ ! -d "libs" ] 
then
    mkdir libs
fi
cd libs &&

# Install cython first
pip install cython cmake

# Clone inside mesh
if [ -d "inside_mesh" ]
then
    rm -rf inside_mesh
fi
git clone https://github.com/Dingry/inside_mesh.git
cd inside_mesh

# Install inside mesh
python setup.py build_ext --inplace &&
pip install .

apt install freeglut3-dev

if [ -d "mesh-fusion" ]
then
    rm -rf mesh-fusion
fi

cd .. && \
    git clone https://github.com/davidstutz/mesh-fusion.git && \
    cd mesh-fusion && \
    cd libfusioncpu && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cd .. && \
    python setup.py build_ext --inplace && \
    pip install . && \
    cd .. && \
    cd librender && \
    python setup.py build_ext --inplace --force && \
    mv pyrender.cpython-3* pyrender.so && \
    pip install .

# librender messes with the installed version of pyrender
pip install --upgrade pyrender