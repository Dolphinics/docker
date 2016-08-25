#Fake uname kernel version output
#set variable KENREL_VER to the desired uname -r output

US=''
UN=''
UR=''
UV=''
UM=''
UP=''
UI=''
UO=''

UNAME='uname.orig'
PROG=$0

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
