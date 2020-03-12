# The Expat License
#
# Copyright (c) 2018, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

STAMP := $(shell date "+%Y-%m-%d")

YS := $(shell date +%Y)/$(STAMP)

BACKUP_DIR = $(HOME)/Backup/Backup/$(YS)/disk-fs
BACKUP_STAMP = $(BACKUP_DIR)/stamp

EXTRA_DATA_DIR = $(HOME)/Backup/extra-data/$(YS)/disk-fs
EXTRA_DATA_STAMP = $(EXTRA_DATA_DIR)/stamp

MYSQL_WIKIDB_BACKUP_FILE = $(BACKUP_DIR)/wikidb.mysql.dump.xz

MUSIC_INDEXES = mp3s-dir-dump.txt.xz home-mp3s-dir-dump.txt.xz

ACER_LAP_MUSIC1_FILE = acer-lap-mp3s-dir-dump.txt
ACER_LAP_MUSIC_INDEXES = $(ACER_LAP_MUSIC1_FILE).xz

MUSIC_INDEXES_FULL_PATHS = $(patsubst %,$(BACKUP_DIR)/%,$(MUSIC_INDEXES))

ACER_LAP_MUSIC_INDEXES_FULL_PATHS = $(patsubst %,$(BACKUP_DIR)/%,$(ACER_LAP_MUSIC_INDEXES))

LOCAL_SVNS = \
	my-blogs-aggregate \
	vim-site \
	www-form-article

LOCAL_SVNS_DIR = $(BACKUP_DIR)/local-svns
LOCAL_SVNS_STAMP = $(LOCAL_SVNS_DIR)/stamp

LOCAL_SVNS_FULL_PATHS = $(patsubst %,$(LOCAL_SVNS_DIR)/%.dump.xz,$(LOCAL_SVNS))

EXTRA_DATA_LINK = $(BACKUP_DIR)/extra-data

COMPRESSION_EXT = .xz
ARC_EXT = .tar$(COMPRESSION_EXT)

HAM_EMAILS_ARC := $(BACKUP_DIR)/Ham-emails$(ARC_EXT)
HAM_EMAILS_CLAWS_ARC := $(BACKUP_DIR)/Ham-emails-claws$(ARC_EXT)
IMPORTANT_HAM_EMAIL_CLAWS_ARC := $(BACKUP_DIR)/Ham-email-Important-claws-$(STAMP)$(ARC_EXT)

SLASH_ETC_ARC = $(BACKUP_DIR)/slash-etc-backup$(ARC_EXT)

DOWNLOAD_IMAGES_ARC = $(BACKUP_DIR)/download-images-$(STAMP)$(ARC_EXT)

FORTUNES_ARC = $(BACKUP_DIR)/usr-share-games-fortunes-$(STAMP)$(ARC_EXT)

EXCLUDES_DIR = $(HOME)/bin/private
HOME_DIR_EXCLUDE_LIST := $(EXCLUDES_DIR)/backup-exclude-list-for-input-to-tar.txt
RSYNC_NET_EXCLUDE_LIST := $(EXCLUDES_DIR)/backup-extra-exclude-list-for-rsync.net-for-input-to-tar.txt
HOME_DIR_EXCLUDE_SOURCES := $(EXCLUDES_DIR)/backup-exclude-list.txt $(EXCLUDES_DIR)/backup-extra-exclude-list-for-rsync.net.txt
EXCLUDE_LISTS = $(patsubst %.txt,%-for-input-to-tar.txt,$(HOME_DIR_EXCLUDE_SOURCES))

HOME_DIR_DIR := $(HOME)
HOME_DIR_ARC := $(BACKUP_DIR)/home-dir-$(STAMP)$(ARC_EXT)

all: local_all vcs_dumps

acer_lap_all: home_dir slash_etc dl_images fortunes

local_all: home_dir music_indexes slash_etc local_svns dl_images db_dump fortunes ham_emails

vcs_dumps: docs_svn_dump

# extra: xchat2_logs own_photos mailing_lists_email spam_ham_email dot_mozilla
extra: xchat2_logs hexchat_logs own_photos dot_mozilla

make_dir: $(BACKUP_STAMP)

$(BACKUP_STAMP):
	mkdir -p $(BACKUP_DIR)
	ln -s $(EXTRA_DATA_DIR) $(EXTRA_DATA_LINK)
	touch $@


DOCS_SVN_TAR = $(BACKUP_DIR)/Docs-Svn-hg-repo-backup-$(STAMP).tar.xz

docs_svn_dump: $(DOCS_SVN_TAR)

PACK_CMD_RAW = tar
TAR_ARGS := --sort=name
PACK_CMD_ARGS = $(TAR_ARGS) -cavf
PACK_CMD = $(PACK_CMD_RAW) $(PACK_CMD_ARGS)

$(DOCS_SVN_TAR):
	$(PACK_CMD) $(DOCS_SVN_TAR) $(HOME)/Docs/Svn

acer_lap_music_indexes: $(ACER_LAP_MUSIC_INDEXES_FULL_PATHS)

DIR_DUMP_CMD = dir-dump --digest MD5 --digest SHA1 --digest SHA-512 --digest-cache FS

$(ACER_LAP_MUSIC_INDEXES_FULL_PATHS): $(BACKUP_STAMP)
	(cd $(BACKUP_DIR) && \
		$(DIR_DUMP_CMD) -o $(ACER_LAP_MUSIC1_FILE) /media/win_d/Music && \
		xz $(ACER_LAP_MUSIC1_FILE) \
	)

music_indexes: $(MUSIC_INDEXES_FULL_PATHS)

$(MUSIC_INDEXES_FULL_PATHS): $(BACKUP_STAMP)
	(cd $(BACKUP_DIR) && \
		$(DIR_DUMP_CMD) --digest-cache-param path="$$HOME/Backup/cache/dosd-mp3s" -o mp3s-dir-dump.txt /home/music/Music/dosd-mp3s && \
		xz mp3s-dir-dump.txt && \
		$(DIR_DUMP_CMD) --digest-cache-param path="$$HOME/Backup/cache/home-mp3s" -o home-mp3s-dir-dump.txt /home/music/Music/mp3s && \
		xz home-mp3s-dir-dump.txt \
	)

# ham_emails: $(HAM_EMAILS_ARC) $(HAM_EMAILS_CLAWS_ARC)
ham_emails: $(HAM_EMAILS_CLAWS_ARC) $(IMPORTANT_HAM_EMAIL_CLAWS_ARC)

$(HAM_EMAILS_ARC): $(BACKUP_STAMP)
	$(PACK_CMD) $@ $(HOME)/.Mail/.Spam.directory/.Ham.directory/

$(HAM_EMAILS_CLAWS_ARC): $(BACKUP_STAMP)
	$(PACK_CMD) $@ $(HOME)/Mail/Spam/Ham/

$(IMPORTANT_HAM_EMAIL_CLAWS_ARC): $(BACKUP_STAMP)
	tar $(TAR_ARGS) --exclude-from=$(HOME_DIR_EXCLUDE_LIST) -cavf $@ $(HOME)/Mail

ACER_LAP_EMAILS_ARC = $(BACKUP_DIR)/Acer-Lap-emails$(ARC_EXT)

acer_lap_emails: $(ACER_LAP_EMAILS_ARC)

$(ACER_LAP_EMAILS_ARC): $(BACKUP_STAMP)
	$(PACK_CMD) $@ $(HOME)/Mail

slash_etc: $(SLASH_ETC_ARC)

# Some files are inaccessible in /etc for an underprivileged, but
# we don't want to backup them - so always succeed.
$(SLASH_ETC_ARC): $(BACKUP_STAMP)
	$(PACK_CMD) $@ /etc || true

local_svns: $(LOCAL_SVNS_FULL_PATHS)

$(LOCAL_SVNS_STAMP): $(BACKUP_STAMP)
	mkdir $(LOCAL_SVNS_DIR)
	touch $@

$(LOCAL_SVNS_FULL_PATHS): %: $(LOCAL_SVNS_STAMP)
	svnadmin dump /home/svn/var/svn/$(patsubst %.dump.xz,%,$(notdir $@)) > $(patsubst %.xz,%,$@)
	xz $(patsubst %.xz,%,$@)

db_dump: mysql_dump

mysql_dump: $(MYSQL_WIKIDB_BACKUP_FILE)

$(MYSQL_WIKIDB_BACKUP_FILE): $(BACKUP_STAMP)
	mysqldump wikidb | xz > $@

dl_images: $(DOWNLOAD_IMAGES_ARC)

$(DOWNLOAD_IMAGES_ARC): $(BACKUP_STAMP)
	(cd $(HOME) ; dir_to_back="Download/Images" ; \
		tar $(TAR_ARGS) --dereference --exclude="$$dir_to_back/Clip-Art/open-clip-art"  \
    	--exclude="$$dir_to_back/Propaganda" \
    	-cavf $@ "$$dir_to_back" \
	)

fortunes: $(FORTUNES_ARC)

$(FORTUNES_ARC): $(BACKUP_STAMP)
	(cd / ; $(PACK_CMD) $@ usr/share/games/fortune*)

$(EXCLUDE_LISTS): %-for-input-to-tar.txt: %.txt
	cat $< | perl -e 'while(<STDIN>){print"$$ARGV[0]/$$_"}' "$(HOME_DIR_DIR)" > $@

home_dir: $(HOME_DIR_ARC)

COMMON_EXCLUDES = --exclude-from=$(HOME_DIR_EXCLUDE_LIST) --exclude=$(HOME)/Mail

$(HOME_DIR_ARC): $(BACKUP_STAMP) $(HOME_DIR_EXCLUDE_LIST)
	tar $(TAR_ARGS) $(COMMON_EXCLUDES) -cavf $@ $(HOME_DIR_DIR) || true

RSYNC_NET_ARC_DIR = $(HOME)/Backup/rsync.net
RSYNC_NET_ARC = $(RSYNC_NET_ARC_DIR)/backup.tar

rsync_net_home_dir: $(RSYNC_NET_ARC)

$(RSYNC_NET_ARC): $(EXCLUDE_LISTS)
	temptar="$@.tar" ; \
	tar  $(TAR_ARGS) $(COMMON_EXCLUDES) --exclude-from=$(RSYNC_NET_EXCLUDE_LIST) -cavf "$$temptar" $(HOME_DIR_DIR) || true ; \
	cd $(RSYNC_NET_ARC_DIR) && \
	rm -fr "$(RSYNC_NET_ARC_DIR)/TRIM" ; \
	mkdir TRIM && \
	cd TRIM && \
	tar -xvf $$temptar ; \
	find home -depth -print0 | xargs -0 rmdir ; \
	( cd ."$$HOME" && $(PACK_CMD) "$@" . ) || true ; \
	rm -f "$$temptar"

$(EXTRA_DATA_STAMP):
	mkdir -p $(EXTRA_DATA_DIR)
	touch $@

XCHAT2_LOGS_ARC := $(EXTRA_DATA_DIR)/xchat2-logs-$(STAMP)$(ARC_EXT)

xchat2_logs: $(XCHAT2_LOGS_ARC)

$(XCHAT2_LOGS_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ "Backup/old-dot-files/dot-xchat2/xchatlogs")

HEXCHAT_LOGS_ARC := $(EXTRA_DATA_DIR)/hexchat-logs-$(STAMP)$(ARC_EXT)
HEXCHAT_SCROLLBACK_ARC := $(EXTRA_DATA_DIR)/hexchat-scrollback-$(STAMP)$(ARC_EXT)

hexchat_logs: $(HEXCHAT_LOGS_ARC) $(HEXCHAT_SCROLLBACK_ARC)

$(HEXCHAT_LOGS_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ ".local/share/hexchat/logs")

$(HEXCHAT_SCROLLBACK_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ ".config/hexchat/scrollback")

# The photos are already compressed so using xz is only time consuming and
# does not save a lot of space. It also interferes with rsync.
PHOTOS_ARC_EXT = .tar

OWN_PHOTOS_ARC := $(EXTRA_DATA_DIR)/Docs-Images-Photos-$(STAMP)$(PHOTOS_ARC_EXT)

own_photos: $(OWN_PHOTOS_ARC)

$(OWN_PHOTOS_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ "Docs/Images/Photos")

MLEMAIL_CLAWS_ARC := $(EXTRA_DATA_DIR)/email-Mailing-Lists-claws-$(STAMP)$(ARC_EXT)

mailing_lists_email: $(MLEMAIL_CLAWS_ARC) $(IMPORTANT_HAM_EMAIL_CLAWS_ARC)

$(MLEMAIL_CLAWS_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ "Mail/Mailing Lists")

SPAM_HAM_EMAIL_ARC := $(EXTRA_DATA_DIR)/email-Spam-and-Ham-$(STAMP)$(ARC_EXT)
SPAM_HAM_EMAIL_CLAWS_ARC := $(EXTRA_DATA_DIR)/email-Claws-Spam-and-Ham-$(STAMP)$(ARC_EXT)

# spam_ham_email: $(SPAM_HAM_EMAIL_ARC) $(SPAM_HAM_EMAIL_CLAWS_ARC)
spam_ham_email: $(SPAM_HAM_EMAIL_CLAWS_ARC)

$(SPAM_HAM_EMAIL_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ ".Mail/.Spam.directory")

$(SPAM_HAM_EMAIL_CLAWS_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ "Mail/Spam")

DOT_MOZILLA_ARC := $(EXTRA_DATA_DIR)/dot-mozilla-$(STAMP)$(ARC_EXT)

dot_mozilla: $(DOT_MOZILLA_ARC)

$(DOT_MOZILLA_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ ".mozilla")

%.show:
	@echo "$* = $($*)"

%.pr:
	@echo $($*)

.PHONY: all dl_images ham_emails home_dir make_dir music_indexes slash_etc local_svns ms_hg fortunes
