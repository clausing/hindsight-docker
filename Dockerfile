FROM python:3.12-slim-bookworm
LABEL maintainer="Jim Clausing, jclausing@isc.sans.edu"
LABEL version="hindsight v2024.11"
LABEL description="Run hindsight.py in a docker container"

WORKDIR /data

RUN apt-get update && apt-get -y install --no-install-recommends git rsync python3-brotli -y \
    && git clone https://github.com/obsidianforensics/hindsight.git \
    && cd hindsight && pip3 install -r requirements.txt \
    && python3 setup.py install && cd .. \
    && git clone https://github.com/cclgroupltd/ccl_simplesnappy.git \
    && git clone https://github.com/cclgroupltd/ccl_chromium_reader.git \
    && cd ccl_simplesnappy && cp -r ccl_simplesnappy /usr/local/lib/python3.12/dist-packages/ \
    && cd ../ccl_chromium_reader && cp -r ccl_chromium_reader /usr/local/lib/python3.12/dist-packages/ \
    && cd .. && rm -rf ccl_*
RUN useradd user

USER user

ENTRYPOINT [ "/usr/local/bin/hindsight.py" ]
CMD [ "--help" ]
