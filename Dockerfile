################################
# Dockerfile: thedcg/tl-archlinux:latest

# Base
FROM archlinux:latest

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
	extra/noto-fonts\
	extra/noto-fonts-cjk\
	extra/noto-fonts-emoji\
	extra/noto-fonts-extra\
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
 && date --iso-8601=ns

# Generate font cache
RUN date --iso-8601=ns\
 && cd /tmp \
 && touch tmplualatex.tex \
 && echo '\documentclass[a4paper]{ltjsarticle}' >> tmplualatex.tex \
 && echo '\usepackage[no-math]{fontspec}' >> tmplualatex.tex \
 && echo '\usepackage[unicode,hidelinks,pdfusetitle]{hyperref}' >> tmplualatex.tex \
 && echo '\IfFontExistsTF{Source Han Serif Regular}{\PassOptionsToPackage{sourcehan}{luatexja-preset}\typeout{** Source Han OTF **}}{%' >> tmplualatex.tex \
 && echo '\IfFontExistsTF{Noto Serif CJK Regular}{\PassOptionsToPackage{noto-otc}{luatexja-preset}\typeout{** Noto CJK OTC **}}{%' >> tmplualatex.tex \
 && echo '\IfFontExistsTF{Source Han Serif JP Regular}{\PassOptionsToPackage{sourcehan-jp}{luatexja-preset}\typeout{** Source Han JP Subset OTF **}}{%' >> tmplualatex.tex \
 && echo '\IfFontExistsTF{Noto Serif CJK JP Regular}{\PassOptionsToPackage{noto-otf}{luatexja-preset}\typeout{** Noto CJK OTF **}}{%' >> tmplualatex.tex \
 && echo '\typeout{** No Source Han / Noto CJK **}}}}}' >> tmplualatex.tex \
 && echo '\PassOptionsToPackage{deluxe}{luatexja-preset}' >> tmplualatex.tex \
 && echo '\usepackage{luatexja-preset}' >> tmplualatex.tex \
 && echo '\usepackage{luatexja-otf}' >> tmplualatex.tex \
 && echo '\begin{document}' >> tmplualatex.tex \
 && echo '\newcommand{\sample}{0123456789 ABC abc \$x\$ {\boldmath\$x\$} あいう アイウ 通信}' >> tmplualatex.tex \
 && echo '{\sample\par}' >> tmplualatex.tex \
 && echo '\hrulefill\par' >> tmplualatex.tex \
 && echo '{\mcfamily\ltseries\sample\par}' >> tmplualatex.tex \
 && echo '{\mcfamily\mdseries\sample\par}' >> tmplualatex.tex \
 && echo '{\mcfamily\bfseries\sample\par}' >> tmplualatex.tex \
 && echo '\hrulefill\par' >> tmplualatex.tex \
 && echo '{\gtfamily\mdseries\sample\par}' >> tmplualatex.tex \
 && echo '{\gtfamily\bfseries\sample\par}' >> tmplualatex.tex \
 && echo '{\gtfamily\ebseries\sample\par}' >> tmplualatex.tex \
 && echo '\hrulefill\par' >> tmplualatex.tex \
 && echo '{\mgfamily\sample\par}' >> tmplualatex.tex \
 && echo '\hrulefill\par' >> tmplualatex.tex \
 && echo '{\sffamily\sample\par}' >> tmplualatex.tex \
 && echo '\hrulefill\par' >> tmplualatex.tex \
 && echo '{\ttfamily\sample\par}' >> tmplualatex.tex \
 && echo '\end{document}' >> tmplualatex.tex \
 && cat tmplualatex.tex \
 && lualatex tmplualatex \
 && rm -rf tmplualatex.* \
 && cd / \
 && date --iso-8601=ns

# End
