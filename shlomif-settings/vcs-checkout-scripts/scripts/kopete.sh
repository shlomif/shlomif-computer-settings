#!/bin/bash
svn co -N 'svn://anonsvn.kde.org/home/kde/trunk/KDE/kdenetwork'
cd kdenetwork
svn up kopete cmake
