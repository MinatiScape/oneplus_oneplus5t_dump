#! /system/bin/sh

if [ ! -d "/data/migration" ]; then
   mkdir -p /data/migration
fi

#Browser
if [ -d "/data/data/com.nearme.browser" ]; then
   mkdir -p /data/migration/Browser/databases
   mkdir -p /data/migration/Browser/shared_prefs

   if [ -d "/data/user/0/com.nearme.browser/databases" ] && [ -d "/data/migration/Browser/databases/" ]; then
     log -p i -t installd "Migrating data database files for nearme browser..."
     cp -rf /data/user/0/com.nearme.browser/databases/ /data/migration/Browser/databases/
   fi
   if [ -d "/data/user/0/com.nearme.browser/shared_prefs" ] && [ -d "/data/migration/Browser/shared_prefs/" ]; then
     log -p i -t installd "Migrating data shared preferences files for nearme browser..."
     cp -rf /data/user/0/com.nearme.browser/shared_prefs/ /data/migration/Browser/shared_prefs/
   fi
   if [ -f "/data/user/0/com.nearme.browser/files/selfSkin.config" ]; then
     log -p i -t installd "Migrating data config files for nearme browser..."
     cp -rf /data/user/0/com.nearme.browser/files/selfSkin.config /data/migration/Browser/
   fi

   chmod -R 777 /data/migration
   chown -R system:system /data/migration
   restorecon -R /data/migration
   log -p i -t installd "Done for package com.nearme.browser."
fi

