FROM emscripten/emsdk:latest

ENV SRC /src

RUN echo "## Install SDL library" \
	&& apt-get -qq -y update \
        && apt-get -qq install -y libsdl2-2.0-0 \
		libsdl2-dev \
                build-essential \
 	&& echo "## Done"
        
WORKDIR ${SRC}

# Copy all the files of this repository to the container.
COPY . ${SRC}

CMD ["bash", "entrypoint.sh"]

