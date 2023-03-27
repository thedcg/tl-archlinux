################################
# Dockerfile: thedcg/tl-archlinux:latest

# ベース
FROM pritunl/archlinux:latest

################################
# Dockerfile

# Maintainer
LABEL org.opencontainers.image.authors="Gravitates Gaudiales <gaudiales@gmail.com>"

# Timezone
ENV TZ=Asia/Tokyo

# アップデート
RUN date --iso-8601=ns\
 && pacman --sync --refresh --sysupgrade --noconfirm\
	core/tzdata\
	core/base-devel\
	core/make\
	core/openssh\
	core/xz\
	extra/git\
	extra/mesa-libgl\
	extra/texlive-bin\
	extra/texlive-core\
	extra/texlive-genericextra\
	extra/texlive-fontsextra\
	extra/texlive-langjapanese\
	extra/texlive-latexextra\
	extra/texlive-pictures\
	extra/texlive-science\
	extra/texlive-bibtexextra\
	extra/texlive-publishers\
	community/biber\
	extra/bc\
	extra/ghostscript\
	extra/gnuplot\
	extra/imagemagick\
	extra/libtiff\
	extra/poppler-data\
	extra/asymptote\
	extra/qpdf\
	extra/qrencode\
 && echo "${TZ}" > /etc/timezone\
 && ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime\
 && ln -s /usr/bin/vendor_perl/biber /usr/bin\
 && kanji-config-updmap-sys ipaex\
 && date --iso-8601=ns

# 終了
