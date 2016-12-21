#!/bin/bash
#run with --install to install fake uname

which uname.orig &> /dev/null
if [ $? -ne 0 ]; then
    if [ $# -gt 0 ] && [ $1 == '--install' ]; then
        if [ $# -ne 2 ]; then
            echo "Usage: $0 --install <desired fake uname -r output>"
            exit 1
        fi
        set -e
        KERNEL_VER=$2
        echo "Installing fake uname to $(which uname) for uname -r = $KERNEL_VER"
        cp $(which uname) $(which uname).orig
        echo "#!$(which bash)" > $(which uname).fake
        echo "KERNEL_VER=$KERNEL_VER" >> $(which uname).fake
        grep -v '#!/' $0 >> $(which uname).fake
        cp $(which uname).fake $(which uname)
        echo "Installed successfully! Run $(which uname) --uninstall to remove"
        exit 0
    fi
    UNAME='uname'
    PROG=$0
    KERNEL_VER="fake_uname-r_here"
else
    if [ $# -eq 1 ] && [ "$1" == '--uninstall' ]; then
        set -e
        echo "Uninstalling fake uname..."
        mv $(which uname.orig) $(which uname)
        echo "Uninstalled successfully! $(which uname).fake remains"
        exit 0
    fi
    UNAME='uname.orig'
    PROG=$0
fi

US=''
UN=''
UR=''
UV=''
UM=''
UP=''
UI=''
UO=''

if [ $# -eq 0 ]; then
    $UNAME; exit
fi

while [ $# -gt 0 ]; do
    ARG=$1

    case $ARG in 
        -a)
            $PROG -s -n -r -v -m -p -i -o
            exit
            ;;
        -s)
            US=$($UNAME -s)
            shift
            ;;
        -n)
            UN=$($UNAME -n)
            shift
            ;;
        -r)
            UR=$KERNEL_VER
            shift
            ;;
        -v)
            UV=$($UNAME -v)
            shift
            ;;
        -m)
            UM=$($UNAME -m)
            shift
            ;;
        -p)
            UP=$($UNAME -p)
            shift
            ;;
        -i)
            UI=$($UNAME -i)
            shift
            ;;
        -o)
            UO=$($UNAME -o)
            shift
            ;;
        --version)
            $UNAME --version
            exit
            ;;
        *)
            $UNAME --help
            exit
            ;;
    esac
done

echo $US $UN $UR $UV $UM $UP $UI $UO
