# librealsense unit test snap

unit test of librealsense packaged as a snap. It consists of:

- F200-live-test
- LR200-live-test
- R200-live-test
- SR300-live-test
- ZR300-live-test
- offline-test

## How to build

    $ git clone https://github.com/swem/librealsense-unit-test-snap.git
    $ cd librealsense-unit-test-snap/
    $ snapcraft

## How to install

After build the snap, install the local snap via:

    $ sudo snap install --dangerous --devmode librealsense-unit-test-snap*.snap 

## How to use

Example:

    $ sudo librealsense-unit-test-snap.ZR300-live-test

