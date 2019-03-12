#!/usr/bin/env bash
export CLASSPATH="$(build-classpath xml-commons-apis xalan-j2 avalon-framework avalon-logkit ant xalan-j2-serializer)"
ant package
