rm -rf /tmp/d3cfrombkp
time rsync -vaz /d/d3cfrombkp/ /tmp/d3cfrombkp

rm -rf  /tmp/d3cfrombkp.bup
bup -d /tmp/d3cfrombkp.bup init
bup -d /tmp/d3cfrombkp.bup index /tmp/d3cfrombkp
bup -d /tmp/d3cfrombkp.bup save -n d3cfrombkp /tmp/d3cfrombkp
bup -d /tmp/d3cfrombkp.bup ls --human-readable -a -l --human-readable d3cfrombkp
bup -d /tmp/d3cfrombkp.bup restore -C /tmp/d3cfrombkp2
GIT_DIR=/tmp/d3cfrombkp.bup git log
GIT_DIR=/tmp/d3cfrombkp.bup git log d3cfrombkp
du -sh  /tmp/d3cfrombkp.bup
bup -d /tmp/d3cfrombkp.bup ls d3cfrombkp
bup -d /tmp/d3cfrombkp.bup ls d3cfrombkp -v
bup -d /tmp/d3cfrombkp.bup ls --human-readable d3cfrombkp
bup -d /tmp/d3cfrombkp.bup ls --human-readable -a d3cfrombkp
