# Use the nvidia/cuda image as the base image
FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu22.04

# Install some basic utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    vim \
    wget \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m arish

RUN chown -R arish:arish /home/arish/

COPY --chown=arish requirements.txt /home/arish/app/

USER arish
# Set the working directory
WORKDIR /home/arish/app
# Install Requirements
RUN pip3 install --upgrade pip
RUN cd /home/arish/app/ && pip3 install -r requirements.txt

#Set path for Jupyter Notebook

ENV PATH="/home/arish/.local/bin:${PATH}"

# Expose the Jupyter Notebook port
EXPOSE 8888

# Start the Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
