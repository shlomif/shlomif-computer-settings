#!/usr/bin/env bash

# Copyright by Shlomi Fish, 2018 under the Expat licence
# https://opensource.org/licenses/mit-license.php

x="$(pwd)"

sgml_lib()
{
    wget -c 'http://validator.w3.org/sgml-lib.tar.gz'
    # tar -tvf sgml-lib.tar.gz
    d="$HOME/Download/unpack/prog/web/"
    mkdir -p "$d"
    cd "$d"
    tar -xvf "$x/sgml-lib.tar.gz"
    cd "$x"
}

wml1()
{
    sudo urpmi wml
}

wml2()
{
    d="wml-extended-apis"
    mkdir "$d"
    cd "$d"
    hg clone https://shlomif@bitbucket.org/shlomif/wml-extended-apis trunk
    cd trunk/xhtml/1.x
    bash Install.bash
    cd "$x"
}

wml_mods()
{
    sudo urpmi --split-length 0 --downloader wget --wget-options -c --auto \
        'perl(CPANPLUS::Dist::Mageia)' \
        'perl(DBD::SQLite)' \
        'perl(DateTime)' \
        'perl(Env::Path)' \
        'perl(File::Find::Object::Rule)' \
        'perl(Games::Solitaire::Verify::Base)' \
        'perl(HTML::Latemp::GenMakeHelpers)' \
        'perl(HTML::Latemp::NavLinks::GenHtml::ArrowImages)' \
        'perl(HTML::Links::Localize)' \
        'perl(HTML::Lint)' \
        'perl(HTML::TokeParser::Simple)' \
        'perl(HTML::TreeBuilder::LibXML)' \
        'perl(HTML::Widgets::NavMenu::JQueryTreeView)' \
        'perl(HTML::Widgets::NavMenu::ToJSON)' \
        'perl(IO::All)' \
        'perl(Inline::C)' \
        'perl(JSON)' \
        'perl(Math::BigInt::GMP)' \
        'perl(Moose)' \
        'perl(MooseX::Getopt)' \
        'perl(MooseX::StrictConstructor)' \
        'perl(Pod::Xhtml)' \
        'perl(Spork::Shlomify)' \
        'perl(Template)' \
        'perl(Term::ReadPassword)' \
        'perl(Test::Differences)' \
        'perl(Test::Trap)' \
        'perl(Text::Sprintf::Named)' \
        'perl(Text::VimColor)' \
        'perl(UNIVERSAL::require)' \
        'perl(XML::Grammar::Fortune)' \
        'perl(XML::Grammar::Fortune::Synd::App)' \
        'perl(XML::Grammar::ProductsSyndication)' \
        'perl(XML::Grammar::Screenplay::App::FromProto)' \
        'perl(XML::LibXSLT)' \
        'perl(YAML::LibYAML)' \
        'perl(YAML::XS)' \
        ack \
        asciidoc \
        autoconf \
        automake \
        cmake \
        docbook-style-xsl-doc \
        docbook-xsl \
        docbook5-style-xsl \
        fortune-mod \
        gcc \
        gcc-c++ \
        git \
        gmp-devel \
        hgsubversion \
        imagemagick \
        inkscape \
        jing \
        make \
        mercurial \
        perl-App-XML-DocBook-Builder \
        perl-devel \
        pngcrush \
        rpm-build \
        ruby-RubyGems \
        spamassassin \
        spamassassin-rules \
        spamassassin-spamc \
        spamassassin-spamd \
        spamassassin-tools \
        subversion \
        tap-devel \
        tidyp \
        txt2html \
        valgrind \
        wml \
        zip

    if ! test -f /usr/bin/sass ; then
        sudo gem install sass
    fi
}
