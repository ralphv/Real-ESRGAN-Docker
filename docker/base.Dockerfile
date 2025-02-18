FROM nvidia/cuda:12.4.0-base-ubuntu22.04

# Install needed libraries
RUN apt update && \
    apt install -y \
    python3 python3-pip git libgl1 libglib2.0-0 ffmpeg libsm6 libxext6 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt clean

# Clone Real-ESRGAN
RUN git clone https://github.com/xinntao/Real-ESRGAN.git /app
RUN apt remove -y git
RUN rm -rf /app/.git /app/tests /app/inputs /app/docs /app/assets /app/.vscode /app/.github

WORKDIR /app

# Install needed python libraries
RUN pip install --no-cache-dir \
    basicsr==1.4.2 \
    facexlib==0.2.5 \
    gfpgan==1.3.5 \
    "numpy<2" \
    scipy \
    opencv-python \
    Pillow \
    tqdm \
    ffmpeg-python \
    torch==1.13.1+cu117 torchvision==0.14.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117

# Cleanup
RUN pip cache purge && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN python setup.py develop
RUN sed -i '1i import warnings\nwarnings.filterwarnings("ignore", category=UserWarning)' inference_realesrgan.py

LABEL org.opencontainers.image.description='Base Real-ESRGAN Image with CUDA support'

ENTRYPOINT ["python", "inference_realesrgan.py"]
CMD ["-h"]
