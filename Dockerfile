FROM python:3.9

RUN apt update \
    && apt install -y libglib2.0-dev libhidapi-hidraw0 libhidapi-libusb0 libdbus-1-dev bluetooth usbutils git \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install hid aioconsole crc8 dbus-python
RUN cd / \
    && git clone https://github.com/Poohl/joycontrol.git

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /joycontrol
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["python3", "./run_controller_cli.py", "PRO_CONTROLLER"]
