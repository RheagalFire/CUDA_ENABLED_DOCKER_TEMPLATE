# CUDA_ENABLED_DOCKER_TEMPLATE
Docker Template for quickly spawing up a gpu supported pytorch notebook with docker. 

- Build using `docker build -t cuda-jupyter .`
- Run using `docker run -p 8888:8888 -v /path/to/your/notebooks:/home/arish/app --gpus all cuda-jupyter`

Remember be sure to give absolute path in `\path\to\your\notebook`


