# notes in this site

## install dependencies

    equivs-build eirotask-site-management
    sudo dpkg -i eirotask-site-management_0.0.0_all.deb
    sudo aptitude install

## structure


    keywords    # keywords of the site, used by bin/keys
    m4/
        defs    # generated with bin/m4keys 
        post    # prelude to defs
        render  # prelude to pandoc
    posts/
        blog posts
