#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�3�WYkms.sh ��[k�0���+N�<�0[�X7H�t�����P�XY�El)Hǹ0��>IN;8�e�C��s�t�~�΅���d��n�9v��_M��i+W,���տ�.ỵ�.!}��8[�X@i�a@+����`p%R�k���~�qI��8�Z+=�gUBQ�9��
t)���g�k|�'��4����<�M^0�U��@�� d���}uM~z������d:}�gq�r��+��t�\�d��4���4��4s���R����^!�<o����$��*�/R�
� b�����`�����@"���{��z�C����#����r��Ȭ�lS�](GF���R�$j]��<P������0L�1�7����Mek����Q����B;yhC�:��W���Zw�'�������9F��S��X3�_��6Z�^�R��>��|鞊�mB�zLi!�6
�F-0b��n�M4?d<|"�>l��Q��6/!aY�R~����ǂ.�����J��&^�y�%�1j��>�ƥ8)'n��\�Os����>�Wtx����@  