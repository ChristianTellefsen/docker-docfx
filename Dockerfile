FROM mono:latest

LABEL maintainer="Christian Tellefsen<christian.tellefsen@gmail.com>" \
      description="For DocFX building (with mono.)"

ENV DOCFX_VER 2.57.2

RUN apt-get update && apt-get install unzip wget git -y && \
    wget -q -P /tmp https://github.com/dotnet/docfx/releases/download/v${DOCFX_VER}/docfx.zip && \
    mkdir -p /opt/docfx && \
    unzip /tmp/docfx.zip -d /opt/docfx && \
    echo '#!/bin/bash\nmono /opt/docfx/docfx.exe $@' > /usr/bin/docfx && \
    chmod +x /usr/bin/docfx && \
    rm -f /tmp/*

CMD ["docfx", "-h"]

