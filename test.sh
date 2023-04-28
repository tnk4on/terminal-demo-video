# asciinema-trim
alias asciinema-trim="podman run --rm -it -v $PWD:/data -w /data quay.io/tnk4on/asciinema-trim"
asciinema-trim in.cast > out.cast

# agg
alias agg="podman run --rm -it -v $PWD:/data -w /data quay.io/tnk4on/agg"
agg --cols 50 --rows 20 how-to-rec.cast how-to-rec.gif

# ffmpeg
alias ffmpeg="podman run --rm -it -v $PWD:$PWD -w $PWD quay.io/tnk4on/ffmpeg"
ffmpeg -sseof -3 -i how-to-rec.gif -update 1 -y last.png

# convert
alias convert="podman run --rm -it -v $PWD:$PWD -w $PWD quay.io/tnk4on/convert"
convert last.png how-to-rec.gif how-to-rec-edit.gif

# gifski
alias gifski="podman run --rm -it -v $PWD:$PWD -w $PWD quay.io/tnk4on/gifski"
mkdir -p img/tmp
ffmpeg -i img/asciinema-play.mov -r 15 img/tmp/frame%04d.png
gifski -o img/gifski.gif img/tmp/*