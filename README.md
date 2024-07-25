# Dockerfile for convert GUI Guider application to html.

**This Dockerfile builds a container of Emscripten SDk that enables Emscripten to convert Gui Guider project to JavaScript**

Note: This funciton only support v8 project.

# How to get started

### Build the container
1. Please make sure you have docker installed on the host.
2. In any directoy: `git clone --recursive https://github.com/nxp/lv_web_emscripten.git -b release/nxp-v8.3.10-gg`
3. `cd lv_web_emscripten`
4. unix: `docker build -t emscripten_gg:v1 .` or `docker build --build-arg http_proxy=${proxy_server} --build-arg https_proxy=${proxy_server} -t emscripten_gg:v1 .`
   windows: `docker build -t emscripten_gg:v1 -f Dockerfile.win .` or `docker build --build-arg http_proxy=${proxy_server} --build-arg https_proxy=${proxy_server} -t emscripten_gg:v1 -f Dockerfile.win .`

### Export Gui Guider project.
Firstly, make sure the code generation is complete.
Then click the "export code -> Emscripten" option On the GUI Guider, Will get a folder that adapts to Emscripten SDK.
### Converting
Please make sure to execute in the above exported directory.
1. `docker run -v ${EXPORTED PROJECT PATH}:/root -it emscripten_gg:v1`
 eg: `docker run -v C:\nxp\gui\demo_html:/root -it emscripten_gg:v1`
2. A file called `index.html` will be generated. Run this in your browser.

#### Known issue
1. Projects using third-party libraries cannot be converted, eg:Gui guider application with freemaster.
2. Chrome can't open the generated html file offline. It works if you copy the files to a server. Use Firefox or other browser for offline testing.
3. Firefox can't open the generated html file offline unless you go to `about:config` and change `privacy.file_unique_origin` to `false`.


