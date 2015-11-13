BASE_DIR = /home/shlomi/Download/unpack/gui/X/nouveau

DRM_DIR = $(BASE_DIR)/DRM/drm

XF86_NOUV_DIR = $(BASE_DIR)/xf86-video-nouveau

all: compile

compile: drm_compile linux_core_compile xf86_nouv_compile

install: drm_install linux_core_install xf86_nouv_install

drm_git:
	(cd $(DRM_DIR) && git-fetch)
	(cd $(DRM_DIR) && git-rebase origin)

drm_compile: drm_git
	(cd $(DRM_DIR) && ./autogen.sh)
	(cd $(DRM_DIR) && ./configure --prefix=/usr)
	(cd $(DRM_DIR) && make)

drm_install:
	(cd $(DRM_DIR) && make install)

LINUX_CORE_DIR = $(DRM_DIR)/linux-core

linux_core_compile: drm_git
	(cd $(LINUX_CORE_DIR) && make nouveau.o)

LINUX_CORE_DEST = /lib/modules/$(shell uname -r)/extra/drm

linux_core_install:
	cd $(LINUX_CORE_DIR) && \
	mkdir -p $(LINUX_CORE_DEST) && \
	cp -f nouveau.ko drm.ko $(LINUX_CORE_DEST)/
	depmod -a -e

xf86_nouv_compile:
	cd $(XF86_NOUV_DIR) && git-fetch
	cd $(XF86_NOUV_DIR) && git-rebase origin
	cd $(XF86_NOUV_DIR) && ./autogen.sh
	cd $(XF86_NOUV_DIR) && make

xf86_nouv_install:
	cd $(XF86_NOUV_DIR) && cp -f src/.libs/nouveau_drv.so /usr/lib/xorg/modules/drivers/

