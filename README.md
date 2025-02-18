
# Real-ESRGAN-Docker

This uses the following repo: [https://github.com/xinntao/Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

## GitHub Image references:

```docker
docker pull ghcr.io/ralphv/realesrgan:latest
```
```docker
docker pull ghcr.io/ralphv/realesrgan-with-models:latest
```

## How to build

```shell
make build
```
By default, this will create three images:

* `ralphv/realesrgan-base`: Base image functional without volumes
* `ralphv/realesrgan`: The main image to use that creates some volumes to retain downloads
* `ralphv/realesrgan-with-models`: Image with pre-downloaded models (recommended)

__WARNING__: The produced images are very large, close to `10 GB`

## Example runs:

* Run to get the help information:
    ```shell
    docker run --rm ralphv/realesrgan
    ```
* Run on a sample input file `test.jpg` to produce the output as `test_out.jpg` in same folder
    ```shell
    docker run --rm --gpus all -v .:/data ralphv/realesrgan-with-models -o /data/ -i /data/test.jpg
    ```
* Run on all files in current directory
    ```shell
    docker run --rm --gpus all -v .:/data ralphv/realesrgan-with-models -o /data/ -i /data/
    ```

### Modify image names:

You can create `.env` file and define a custom image name using the variable `IMAGE_NAME`
```dotenv
IMAGE_NAME: <custom>/realesrgan
```

### Useful command line arguments
* `--face_enhance`: Enhances faces but sometimes can create weird faces.
* `--fp32`: Use fp32 precision during inference. Default: fp16 (half precision).
* `-s 2`: The scaling factor, can be put to 1 to just enhance images.

You can find more info at the [main repo of the library here.](https://github.com/xinntao/Real-ESRGAN)

### Useful aliases

```shell
alias enhance='docker run --rm --gpus all -v .:/data ghcr.io/ralphv/realesrgan-with-models --fp32 -i /data/ -o /data/ -s 1'
```
```shell
alias enlarge='docker run --rm --gpus all -v .:/data ghcr.io/ralphv/realesrgan-with-models --fp32 -i /data/ -o /data/ -s 2'
```
```shell
alias enhancef='docker run --rm --gpus all -v .:/data ghcr.io/ralphv/realesrgan-with-models --face_enhance --fp32 -i /data/ -o /data/ -s 1'
```
```shell
alias enlargef='docker run --rm --gpus all -v .:/data ghcr.io/ralphv/realesrgan-with-models --face_enhance --fp32 -i /data/ -o /data/ -s 2'
```
