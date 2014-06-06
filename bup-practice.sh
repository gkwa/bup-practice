if test -z "$DATA_DRIVE"
then
    echo set \$DATA_DRIVE first.  Quitting.
    exit 1
fi

d=$(date +%Y%M%d%H%M%s)

basedir=$(cygpath -u $DATA_DRIVE/$d)

rm -rf $basedir
mkdir -p $basedir

rm -rf $basedir/d3cfrombkp
time rsync -vaz /d/d3cfrombkp/ $basedir/d3cfrombkp

rm -rf  $basedir/d3cfrombkp.bup
bup -d $basedir/d3cfrombkp.bup init
bup -d $basedir/d3cfrombkp.bup index $basedir/d3cfrombkp
bup -d $basedir/d3cfrombkp.bup save -n d3cfrombkp $basedir/d3cfrombkp
bup -d $basedir/d3cfrombkp.bup ls --human-readable -a -l --human-readable d3cfrombkp
bup -d $basedir/d3cfrombkp.bup restore -C $basedir/d3cfrombkp2
GIT_DIR=$basedir/d3cfrombkp.bup git log
GIT_DIR=$basedir/d3cfrombkp.bup git log d3cfrombkp
du -sh  $basedir/d3cfrombkp.bup
bup -d $basedir/d3cfrombkp.bup ls d3cfrombkp
bup -d $basedir/d3cfrombkp.bup ls d3cfrombkp -v
bup -d $basedir/d3cfrombkp.bup ls --human-readable d3cfrombkp
bup -d $basedir/d3cfrombkp.bup ls --human-readable -a d3cfrombkp
