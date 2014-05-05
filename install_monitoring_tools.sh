#!/bin/bash

rpmforge()
{
    ### RPMForge release version
    # source rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    Major=0.5
    Minor=3-1
    Rel=$Major.$Minor

    case $1 in
        install )
            # install rpmforge
            cd /tmp
            wget http://packages.sw.be/rpmforge-release/rpmforge-release-$Rel.el$SLVer.rf.$Arch.rpm
            sudo rpm -ihv rpmforge-release*.rpm
            rm -f rpmforge-release*.rpm ;;

        uninstall )
            # install rpmforge
            sudo yum remove -y rpmforge-release ;;
    esac
}

system_vars()
{
    Arch=$( uname -p )
    # Grab SL version before adding repository
    SLVer=$(cat /etc/redhat-release | sed -e 's#[^0-9]##g' | cut -c1)
}

system_vars

rpmforge install

# Install HTOP
sudo yum install -y htop

# END - Clean up

# Remove rpmforge to prevent repo parsing issue in the future
rpmforge uninstall


