ARG BASE_IMAGE_NAME=missing-build-argument
FROM ${BASE_IMAGE_NAME}

ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-animevideov3.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-wdn-x4v3.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesr-general-x4v3.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.3.0/RealESRGANv2-animevideo-xsx2.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.3.0/RealESRGANv2-animevideo-xsx4.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B_netD.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.3/RealESRGAN_x2plus_netD.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.3/RealESRGAN_x4plus_netD.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/ESRGAN_SRx4_DF2KOST_official-ff704c30.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.1/RealESRNet_x4plus.pth /app/weights/
ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth /app/weights/

ADD https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth /app/gfpgan/weights/detection_Resnet50_Final.pth
ADD https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth /app/gfpgan/weights/parsing_parsenet.pth
ADD https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth /usr/local/lib/python3.10/dist-packages/gfpgan/weights/GFPGANv1.3.pth

VOLUME ["/app/inputs", "/app/experiments", "/app/results"]

LABEL org.opencontainers.image.description='Main Real-ESRGAN Image with Models and CUDA support'
