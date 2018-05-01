#!/usr/bin/env bash

TARGET_BASHRC=~/.bashrc
INSTALLER_FILE=rc_install.sh

if [ -f "$TARGET_BASHRC" ]; then
    BACKUP="$TARGET_BASHRC.back.$RANDOM"
    echo "Current $TARGET_BASHRC will be backed up in $BACKUP"
    #cp $TARGET_BASHRC $BACKUP
    echo "Removing $TARGET_BASHRC"
    rm $TARGET_BASHRC
fi

printf "#!/usr/bin/env bash\n\n" > $TARGET_BASHRC

find . -name $INSTALLER_FILE -exec {} \;
