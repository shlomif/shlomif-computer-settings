MODULE_STARTER_HG_REPOS_ARC := $(BACKUP_DIR)/Module-Starter-Hg-Repos.tar.gz

ms_hg: $(MODULE_STARTER_HG_REPOS_ARC)

$(MODULE_STARTER_HG_REPOS_ARC): $(BACKUP_STAMP)
	tar -czvf $@ $(HOME)/progs/perl/cpan/Module/Starter/hg/trunk

svk: $(SVK_LOCAL_DUMP)

$(SVK_LOCAL_DUMP): $(BACKUP_STAMP)
	svnadmin dump $(HOME)/.svk/local | gzip > $@

SVK_LOCAL_DUMP := $(BACKUP_DIR)/$(shell whoami)-svk-local.dump.gz

OSVN_ORIG_DIR = $(HOME)/Backup/svn-dumps/opensvn/svnsync-repos/

OSVN_BACKUP_DIR = $(BACKUP_DIR)/opensvn-dump
OSVN_BACKUP_STAMP = $(OSVN_BACKUP_DIR)/stamp

osvn: $(OSVN_BACKUP_STAMP)

$(OSVN_BACKUP_STAMP) : $(BACKUP_STAMP)
	(cd $(OSVN_ORIG_DIR) ; bash sync-all.bash ; bash dump-all.bash)
	mkdir $(OSVN_BACKUP_DIR)
	cp $(OSVN_ORIG_DIR)/DUMPS/*.gz $(OSVN_BACKUP_DIR)/
	touch $@

MLEMAIL_ARC := $(EXTRA_DATA_DIR)/email-Mailing-Lists-$(STAMP).tar.gz
# mailing_lists_email: $(MLEMAIL_ARC) $(MLEMAIL_CLAWS_ARC)
$(MLEMAIL_ARC): $(EXTRA_DATA_STAMP)
	(cd $(HOME) ; $(PACK_CMD) $@ ".Mail/.Mailing Lists.directory")

PROJECTLOCKER_ORIG_DIR = $(HOME)/Backup/svn-dumps/projectlocker/svnsync-repos/

PROJECTLOCKER_BACKUP_DIR = $(BACKUP_DIR)/projectlocker-dump
PROJECTLOCKER_BACKUP_STAMP = $(PROJECTLOCKER_BACKUP_DIR)/stamp
projectlocker: $(PROJECTLOCKER_BACKUP_STAMP)

$(PROJECTLOCKER_BACKUP_STAMP) : $(BACKUP_STAMP)
	(cd $(PROJECTLOCKER_ORIG_DIR) ; bash sync-all.bash ; bash dump-all.bash)
	mkdir $(PROJECTLOCKER_BACKUP_DIR)
	cp $(PROJECTLOCKER_ORIG_DIR)/DUMPS/*.gz $(PROJECTLOCKER_BACKUP_DIR)/
	touch $@

GOOGLE_CODE_ORIG_DIR = $(HOME)/Backup/svn-dumps/google-code/svnsync-repos/
GOOGLE_CODE_BACKUP_DIR = $(BACKUP_DIR)/google-code-dump
GOOGLE_CODE_BACKUP_STAMP = $(GOOGLE_CODE_BACKUP_DIR)/stamp

google-code: $(GOOGLE_CODE_BACKUP_STAMP)

$(GOOGLE_CODE_BACKUP_STAMP) : $(BACKUP_STAMP)
	(cd $(GOOGLE_CODE_ORIG_DIR) ; bash sync-all.bash ; bash dump-all.bash)
	mkdir $(GOOGLE_CODE_BACKUP_DIR)
	cp $(GOOGLE_CODE_ORIG_DIR)/DUMPS/*.gz $(GOOGLE_CODE_BACKUP_DIR)/
	touch $@

FFO_SVN_ORIG_DIR = $(HOME)/Backup/svn-dumps/File-Find-Object
FFO_SVN_BACKUP_DIR = $(BACKUP_DIR)/file-find-object-dump
FFO_SVN_BACKUP_STAMP = $(FFO_SVN_BACKUP_DIR)/stamp

ffo-svn: $(FFO_SVN_BACKUP_STAMP)

$(FFO_SVN_BACKUP_STAMP) : $(BACKUP_STAMP)
	(if test -e "$(HOME)/.ssh/id_rsa_sh" ; then ssh-add "$(HOME)/.ssh/id_rsa_sh" ; fi; cd $(FFO_SVN_ORIG_DIR) ; ./dump)
	mkdir $(FFO_SVN_BACKUP_DIR)
	cp $(FFO_SVN_ORIG_DIR)/DUMPS/*.xz $(FFO_SVN_BACKUP_DIR)/
	touch $@

BERLIOS_SVNS = better-scm fc-solve gimp-test gringotts ip-noise jmikmod perl-begin quad-pres thewml web-cpan winapt

# BERLIOS_SVNS_FULL_PATHS = $(patsubst %,$(BACKUP_DIR)/%-repos.gz,$(BERLIOS_SVNS))
BERLIOS_SVNS_FULL_PATHS = $(patsubst %,$(BACKUP_DIR)/%-svnroot.tar.gz,$(BERLIOS_SVNS))
berlios: $(BERLIOS_SVNS_FULL_PATHS)

$(BERLIOS_SVNS_FULL_PATHS): %: $(BACKUP_STAMP)
	(cd $(BACKUP_DIR) && wget http://svn.berlios.de/svndumps/$(notdir $@))
	touch $@
