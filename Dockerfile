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
	extra/ghostscript\
	extra/poppler-data\
	extra/asymptote\
 && date --iso-8601=ns

ADD kanjix.map /var/lib/texmf/fonts/map/dvipdfmx/updmap/

# 終了
