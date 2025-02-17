
# Real-ESRGAN-Docker

This uses the following repo: [https://github.com/xinntao/Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

## How to use

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