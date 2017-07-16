################################
# Dockerfile: thedcg/tl-archlinux:latest

# ベース
FROM pritunl/archlinux:latest

################################
# Dockerfile

# 管理者
MAINTAINER Lemures Lemniscati <lemures.lemniscati@gmail.com>

# アップデート
RUN date --iso-8601=ns\
 && pacman --sync --refresh --sysupgrade --noconfirm\
	core/make\
	core/openssh\
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
	extra/ghostscript\
	extra/poppler-data\
	extra/asymptote\
 && ln -s /usr/bin/vendor_perl/biber /usr/bin\
 && date --iso-8601=ns

ADD kanjix.map /var/lib/texmf/fonts/map/dvipdfmx/updmap/

RUN date --iso-8601=ns\
 && kanji-config-updmap-sys ipaex\
 && date --iso-8601=ns

# 終了
