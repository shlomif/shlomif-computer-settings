# apache_path=/usr/local/apps/apache2/
# apache_path=/usr
apache_path=/opt/apache2-shlomif
args="--with-apr=$apache_path 
      --with-apr-util=$apache_path  
      --with-apxs=$apache_path/bin/apxs
      --disable-neon-version-check
      --without-sasl
      "
      
# --with-berkeley-db=/usr/local/apps/db-4.2 \    
