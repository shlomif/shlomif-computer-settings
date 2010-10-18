# apache_path=/usr/local/apps/apache2/
apache_path=/usr
args="--with-apr=$apache_path 
      --with-apr-util=$apache_path  
      --without-apxs
      --disable-neon-version-check
      --without-sasl
      "
      
# --with-berkeley-db=/usr/local/apps/db-4.2 \    
