<<<<<<< HEAD
%%%%%%%%%%%%%%%%%%%%%%
%% start of file `cmcthesis.cls`.
%% Copyright 2020-2021 Hoganbin (八一) and  Camuse (酸奶)
%%
%% This work may be distributed and/or modified freely
%% Last Modification 2019-08-17
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
% !TeX root = CMC.tex
\NeedsTeXFormat{LaTeX2e}
\RequirePackage[l2tabu,orthodox]{nag}
\RequirePackage{expl3,xparse,xtemplate,l3keys2e}
\ExplSyntaxOn
\ProvidesClass{cmcthesis}
\newif\ifennoto\ennotofalse
\newif\ifzhnoto\zhnotofalse
\newif\ifzhorigin\zhoriginfalse
\newif\ifmathfree\mathfreefalse
\newif\ifnewtxmath\newtxmathfalse

\keys_define:nn {cmcthesis} {
	hideanswer         .choice:           					,
	hideanswer         .default:n = false 					,
	hideanswer / false .code:n    = \newif\ifcomm\commfalse ,
	hideanswer / true  .code:n    = \newif\ifcomm\commtrue  ,
	
	enfont             .choice:                         ,	
	enfont             .default:n = empty               ,
	enfont / newtxtext .code:n    = \RequirePackage{#1} ,
	enfont / empty     .code:n    =                     ,
	enfont / noto      .code:n    = \ennototrue         ,
	
	zhfont           .choice:           ,	
	zhfont           .default:n = empty ,
	zhfont / empty   .code:n =                                            ,
	zhfont / mac     .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / macnew  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / macold  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / windows .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / ubuntu  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / zhnoto  .code:n = \PassOptionsToClass{fontset =none}{ctexart}
	\zhnototrue,
	zhfont / origin  .code:n = \PassOptionsToClass{fontset =none}{ctexart}
	\zhorigintrue,
	
	mathfont                .choice:           ,	
	mathfont                .default:n = empty ,
	mathfont / empty        .code:n    =       ,
	mathfont / newtxmath    .code:n    = \RequirePackage{#1} \newtxmathtrue ,
	mathfont / mtpro2       .code:n    = \RequirePackage{#1} ,
	mathfont / unicode-math .code:n    = \mathfreetrue       ,
}

\ProcessKeysOptions {cmcthesis}
\LoadClass [11pt, ] {ctexart} %twoside

\ifnewtxmath
\else
\RequirePackage{amsmath}
\fi
\RequirePackage
{
	enumerate      ,
	calc           , 
	intcalc        ,
	ifthen         ,
	zref-user      ,
	zref-lastpage  ,
	makecell       , 
	dashrule       ,
	parskip        ,
	esvect         ,
	cases          ,
	graphicx       ,
	paralist       ,
	enumitem       ,
% 	ulem           ,
    xeCJKfntef     ,
	wrapfig        ,
	geometry       ,
	fancyhdr       ,
	lastpage       ,
	multicol       ,
	multirow	   ,
	array		   ,
	booktabs       ,
	verbatim       ,
	listings       ,
	accsupp        ,
	xcolor         ,
	tikz           ,
	% interfaces-makecell,	
}

\ifennoto
\RequirePackage{noto}
\fi

\ifzhnoto
\setCJKmainfont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSerifCJKsc}
\setCJKsansfont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSansCJKsc}
\setCJKmonofont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSansMonoCJKsc}  
\fi


\ifzhorigin

\fontspec_font_if_exist:nTF {HYShuSongErJ}{
	\setCJKmainfont{HYShuSongErJ}%\rmfamily
	\setCJKfamilyfont{zhsong}{HYShuSongErJ}
}{
	\setCJKmainfont[Path=fonts/,]{HYShuSongErJ}%\rmfamily
	\setCJKfamilyfont{zhsong}[Path=fonts/,]{HYShuSongErJ}
}

\fontspec_font_if_exist:nTF {HYZhongHeiS}{
	\setCJKsansfont{HYZhongHeiS}%\sffamily
	\setCJKfamilyfont{zhhei}{HYZhongHeiS}% 细黑、黑体（同 sans）
}{
	\setCJKsansfont[Path=fonts/,]{HYZhongHeiS}
	\setCJKfamilyfont{zhhei}[Path=fonts/,]{HYZhongHeiS}
}

\fontspec_font_if_exist:nTF {HYFangSongS}{
	\setCJKmonofont{HYFangSongS}%\ttfamily
	\setCJKfamilyfont{zhhei}{HYFangSongS}% 仿宋（同 mono）
}{
	\setCJKmonofont[Path=fonts/,]{HYFangSongS}
	\setCJKfamilyfont{zhhei}[Path=fonts/,]{HYFangSongS}
}

\fontspec_font_if_exist:nTF {HYKaiTiS}{
	\setCJKfamilyfont{zhkai}{HYKaiTiS} % 楷体
}{
	\setCJKfamilyfont{zhkai}[Path=fonts/,]{HYKaiTiS}
}

\fontspec_font_if_exist:nTF {HYDaSongJ}{
	\setCJKfamilyfont{bs}{HYDaSongJ}% 标song
}{
	\setCJKfamilyfont{bs}[Path=fonts/,]{HYDaSongJ}
}
\setCJKfamilyfont{kd}{华文行楷}
\def\heiti{\CJKfamily{zhhei}}
\def\songti{\CJKfamily{zhsong}}
\def\fangsong{\CJKfamily{zhfs}}
\def\kaishu{\CJKfamily{zhkai}}
\def\bs{\CJKfamily{bs}}
\fi

\ifmathfree
\RequirePackage{unicode-math}
\fi
\setlength { \multicolsep	 } { 0.00 pt }
\setlength { \abovetopsep	 } { 0.00 ex } 
\setlength { \belowrulesep	 } { 0.00 ex }
\setlength { \aboverulesep   } { 0.00 ex } 
\setlength { \belowbottomsep } { 0.00 ex }
\setlength { \heavyrulewidth } { 0.08 em }

\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\geometry{	
	paperheight = 195mm ,
	paperwidth	= 195mm ,
	left		= 30mm  ,
	right		= 25mm  ,
	top			= 20mm  ,
	bottom      = 20mm  ,
	headsep     = 10.0 pt ,
}  
\graphicspath{{image/}}

\lstdefinestyle{lfonts}{
	basicstyle   = \footnotesize\ttfamily         ,
	stringstyle  = \color{purple}                 ,
	keywordstyle = \color{blue!60!black}\bfseries ,
	commentstyle = \color{olive}\scshape		  ,
}
\lstdefinestyle{lnumbers}{
	numbers     = left  ,
	numberstyle = \tiny ,
	numbersep   = 1em	,
	firstnumber = 1		,
	stepnumber  = 1		,
}
\lstdefinestyle{llayout}{
	breaklines       = true		,
	tabsize          = 2		,
	columns          = flexible ,
}
\lstdefinestyle{lgeometry}{
	xleftmargin      = 20pt		,
	xrightmargin     = 0pt		,
	frame            = tb		,
	framesep         = \fboxsep ,
	framexleftmargin = 20pt		,
}
\lstdefinestyle{lgeneral}{
	style = lfonts	  ,
	style = lnumbers  ,
	style = llayout	  ,
	style = lgeometry ,
}
\lstdefinestyle{c}{
	language = {c}      ,
	style    = lgeneral ,
}

\newcommand{\noncopynumber}[1]{%
	\BeginAccSupp{method=escape,ActualText={}}%
	#1%
	\EndAccSupp{}%
}

\lstdefinestyle{tex}{
	language={[LaTeX]TeX},
	numbers=left,
	numbersep=1em,
	numberstyle=\tiny\noncopynumber,
	frame=single,
	framesep=\fboxsep,
	framerule=\fboxrule,
	rulecolor=\color{cyan},
	xleftmargin=\dimexpr\fboxsep+\fboxrule\relax,
	xrightmargin=\dimexpr\fboxsep+\fboxrule\relax,
	breaklines=true,
	basicstyle=\small\tt,
	keywordstyle=\color{blue},
	commentstyle=\color[rgb]{0.13,0.54,0.13},
	%backgroundcolor=\color{yellow!10},
	tabsize=2,
	columns=flexible,
	morekeywords={maketitle},
	escapeinside={\%LISTING:}{\^^M},
	breaklines= true,
}
%用到的长度变量
\newlength{\wot}
\newlength{\wol}
\newlength{\gmw}
\newlength{\dl}

%长度变量的初始值
\settowidth{\wot}{复核人}
\setlength{\wol}{0.3pt}
\setlength{\gmw}{6em}
\setlength{\dl}{10em}

\renewcommand{\baselinestretch}{1.5}

%页眉设置开始
\renewcommand{\headrulewidth}{0pt}


%页脚设置开始
\fancyfoot[C]{\bfseries \ifcomm CMC试题\else 参考解答\fi \quad 第{\sffamily\thepage} 页 (共~{\sffamily\pageref{LastPage}}~页)}
\newcounter{ns}
\newcounter{ts}
\newcounter{nq}
\newcommand{\wns}{\stepcounter{ns}\zhnumber{\thens}、}
\newcommand{\wq}{\stepcounter{nq}\thenq.}



%大题前计分表格
\newcommand{\tbs}{\begin{tabular}{|c|c|c|}\hline \makebox[\wot]{得分}&\makebox[\wot]{评卷人}&\makebox[\wot]{复核人}\\ \hline
		& &\\ \hline\end{tabular}}

%排版大题前计分表格,序号,题型,大题说明
\newcommand{\ws}[2]{\raisebox{-1ex}
	{\begin{minipage}[b]{4.6\wot}\tbs\end{minipage}}
	\begin{minipage}[t]{\textwidth-6\wot} 
		{\heiti \wns #1 } #2 \end{minipage}
}
\makeatletter
\zref@newprop{totalsections}[3]{\arabic{ns}}
\zref@addprop{LastPage}{totalsections}
\AtBeginDocument{
	\setcounter{ts}{\zref@extractdefault{LastPage}{totalsections}{3}} }
\makeatother
\linespread{1.618}
\newcommand{\D}{\,\mathrm{d}}
\newcommand{\E}{\mathrm{e}}
\newcommand{\dlim}{\displaystyle \lim }
\newcommand{\dint}{\displaystyle \int }
\newcommand{\sets}[1]{\{ #1 \}}


\pagestyle{fancy}

%装订线开始
\fancyheadoffset[OL,ER]{\gmw}
\fancyhead[OL]{
	\ifnum\intcalcMod{\value{page}}{4}=1
	\rotatebox{90}
	{\begin{minipage}{1.1\textheight}
			\begin{center}
				省市：\rule[-.2ex]{\dl}{\wol} 学校：\rule[-.2ex]{\dl}{\wol}  姓名：\rule[-.2ex]{\dl}{\wol} 准考证号：\rule[-.2ex]{\dl}{\wol}\\
				\tiny \hdashrule[-3ex]{\textheight}{\wol}{3pt}\\[\smallskipamount]
				\makebox[0.6\textheight][s]{装订线内不要答题}\\[-3\smallskipamount]
				\hdashrule[-3ex]{\textheight}{\wol}{3pt}
			\end{center}
	\end{minipage} }
	\fi
}
\fancyhead[ER]{
	\ifnum\intcalcMod{\value{page}}{4}=0
	\rotatebox{-90}
	{\begin{minipage}{1.1\textheight}
			\begin{center}
				\tiny \hdashrule[-3ex]{\textheight}{\wol}{3pt}\\[\smallskipamount]
				\makebox[0.6\textheight][s]{装订线内不要答题}\\[-3\smallskipamount]
				\hdashrule[-3ex]{\textheight}{\wol}{3pt}
			\end{center}
	\end{minipage} }
	\fi
}
%装订线结束

%选择题选项的排法
\newcommand{\onech}[4]{\makebox[3.2cm][l]{A.~#1}\makebox[3.2cm][l]{B.~#2}\makebox[3.2cm][l]{C.~#3}\makebox[3.2cm][l]{D.~#4}}%一行
\newcommand{\twoch}[4]{\makebox[6.4cm][l]{A.~#1}\makebox[6.4cm][l]{B.~#2}\\ \makebox[6.4cm][l]{C.~#3}\makebox[6.4cm][l]{D.~#4}}%两行

%分数线延长
\newcommand{\zfrac}[2]{\dfrac{{\raisebox{-0.6mm}{$#1$}}}{\;{ \raisebox{0.2mm} {$#2$}}\;}}

%三角形
\newcommand{\sjx}{\raisebox{0.7ex} {$_{\triangle}$}}

%直立积分号，需要mathabx宏包
\makeatletter
\def\upintkern@{\mkern-7mu\mathchoice{\mkern-2mu}{}{}{}}
\def\upintdots@{\mathchoice{\mkern-4mu\@cdots\mkern-4mu}%
	{{\cdotp}\mkern1.5mu{\cdotp}\mkern1.5mu{\cdotp}}%
	{{\cdotp}\mkern1mu{\cdotp}\mkern1mu{\cdotp}}%
	{{\cdotp}\mkern1mu{\cdotp}\mkern1mu{\cdotp}}}
\newcommand{\upiint}{\DOTSI\protect\UpMultiIntegral{2}}
\newcommand{\upiiint}{\DOTSI\protect\UpMultiIntegral{3}}
\newcommand{\upiiiint}{\DOTSI\protect\UpMultiIntegral{4}}
\newcommand{\upidotsint}{\DOTSI\protect\UpMultiIntegral{0}}
\newcommand{\UpMultiIntegral}[1]{%
	\edef\ints@c{\noexpand\upintop
		\ifnum#1=\z@\noexpand\upintdots@\else\noexpand\upintkern@\fi
		\ifnum#1>\tw@\noexpand\upintop\noexpand\upintkern@\fi
		\ifnum#1>\thr@@\noexpand\upintop\noexpand\upintkern@\fi
		\noexpand\upintop
		\noexpand\ilimits@
	}%
	\futurelet\@let@token\ints@a
}
\makeatother

\DeclareFontFamily{U}{mathx}{\hyphenchar\font45}
\DeclareFontShape{U}{mathx}{m}{n}{
	<->s * [0.8]
	mathx10
}{}
\DeclareSymbolFont{mathx}{U}{mathx}{m}{n}
\DeclareFontSubstitution{U}{mathx}{m}{n}
\DeclareMathSymbol{\upintop}{\mathop}{mathx}{'273}
%\DeclareMathSymbol{\upiint}{\mathop}{mathx}{'274}
%\DeclareMathSymbol{\upiiint}{\mathop}{mathx}{'275}
\DeclareMathSymbol{\upointop}{\mathop}{mathx}{'276}
\DeclareMathSymbol{\upoiint}{\mathop}{mathx}{'277}
\makeatletter
\newcommand{\upint}{\DOTSI\upintop\ilimits@}
\newcommand{\upoint}{\DOTSI\upointop\ilimits@}



\ifnewtxmath
\else
\DeclareFontEncoding { LS2 } { } { \noaccents@ }
\DeclareMathRadical  { \sqrtsign } {symbols} { 112 } {largesymbols} { 112 }

\SetSymbolFont { symbols      } { bold } { OMS } { mdput } { bx } { n }
\SetSymbolFont { largesymbols } { bold } { OMX } { mdput } { bx } { n }

\DeclareFontSubstitution { OMS } { mdput } { m } { n }
\DeclareFontSubstitution { OMX } { mdput } { m } { n }
\DeclareFontSubstitution { LS2 } { stix  } { m } { n }

\DeclareSymbolFont { symbols      } { OMS } { mdput   } { m } { n }
\DeclareSymbolFont { largesymbols } { OMX } { mdput   } { m } { n }
\DeclareSymbolFont { integrals    } { LS2 } { stixcal } { m } { n }

\DeclareMathSymbol { \intupop                } { \mathop } { integrals } { "AF }
\DeclareMathSymbol { \iintupop               } { \mathop } { integrals } { "B0 }
\DeclareMathSymbol { \iiintupop              } { \mathop } { integrals } { "B1 }
\DeclareMathSymbol { \ointupop               } { \mathop } { integrals } { "B2 }
\DeclareMathSymbol { \oiintupop              } { \mathop } { integrals } { "B3 }
\DeclareMathSymbol { \oiiintupop             } { \mathop } { integrals } { "B4 }
\DeclareMathSymbol { \intclockwiseupop       } { \mathop } { integrals } { "B5 }
\DeclareMathSymbol { \varointclockwiseupop   } { \mathop } { integrals } { "B6 }
\DeclareMathSymbol { \ointctrclockwiseupop   } { \mathop } { integrals } { "B7 }
\DeclareMathSymbol { \sumintupop             } { \mathop } { integrals } { "B8 }
\DeclareMathSymbol { \iiiintupop             } { \mathop } { integrals } { "B9 }
\DeclareMathSymbol { \intbarupop             } { \mathop } { integrals } { "BA }
\DeclareMathSymbol { \intBarupop             } { \mathop } { integrals } { "BB }
\DeclareMathSymbol { \fintupop               } { \mathop } { integrals } { "BC }
\DeclareMathSymbol { \cirfnintupop           } { \mathop } { integrals } { "BD }
\DeclareMathSymbol { \awintupop              } { \mathop } { integrals } { "BE }
\DeclareMathSymbol { \rppolintupop           } { \mathop } { integrals } { "BF }
\DeclareMathSymbol { \scpolintupop           } { \mathop } { integrals } { "C0 }
\DeclareMathSymbol { \npolintupop            } { \mathop } { integrals } { "C1 }
\DeclareMathSymbol { \pointintupop           } { \mathop } { integrals } { "C2 }
\DeclareMathSymbol { \sqintupop              } { \mathop } { integrals } { "C3 }
\DeclareMathSymbol { \intlarhkupop           } { \mathop } { integrals } { "C4 }
\DeclareMathSymbol { \intxupop               } { \mathop } { integrals } { "C5 }
\DeclareMathSymbol { \intcapupop             } { \mathop } { integrals } { "C6 }
\DeclareMathSymbol { \intcupupop             } { \mathop } { integrals } { "C7 }
\DeclareMathSymbol { \upintupop              } { \mathop } { integrals } { "C8 }
\DeclareMathSymbol { \lowintupop             } { \mathop } { integrals } { "C9 }
\fi

\XeTeXdefaultencoding "UTF-8"
\lineskiplimit=5.5pt
\lineskip=10pt

% cover
%\ExplSyntaxOn
\tl_new:N \l__cmcthesis_title_date_tl
\tl_new:N \l__cmcthesis_title_name_tl
\tl_new:N \l__cmcthesis_title_subname_tl
\tl_new:N \l__cmcthesis_title_author_tl
\tl_new:N \l__cmcthesis_title_motto_tl
\keys_define:nn { cmcthesis }
{
	date    .tl_set:N = \l__cmcthesis_title_date_tl   ,
	name    .tl_set:N = \l__cmcthesis_title_name_tl   ,
	subname .tl_set:N = \l__cmcthesis_title_subname_tl   ,
	author  .tl_set:N = \l__cmcthesis_title_author_tl  ,
	motto   .tl_set:N = \l__cmcthesis_title_motto_tl  ,
}
%art
\DeclareDocumentCommand \cmcthesistitle { m }
{
	\group_begin:
	\keys_set:nn { cmcthesis } { #1 }{
		{\noindent\sffamily 
			{
				{
				\heiti 绝密 $\bigstar$ 启用前
				} 
				\hfill 
				{
					\heiti \l__cmcthesis_title_motto_tl
%				\tikz\node{};
					%\includegraphics[width=0.05\textwidth]{logo.pdf}
				}
			} 	
		}\par
		\ifzhorigin
		\begin{center}
			{\xingkai  \zihao{3}\l__cmcthesis_title_name_tl }\\
%			{\zihao{-3}\heiti\l__cmcthesis_title_name_tl\thinspace{\thinspace \bf\uppercase\expandafter\thinspace} 
		{\zihao{-3}  \heiti  数学类\thinspace \ifcomm\else 答案\fi}\\
			\zihao{-3}\l__cmcthesis_title_date_tl\\
			
		\end{center}
		\else
		\begin{center}
			{\bfseries\zihao{3}\l__cmcthesis_title_name_tl}\\
%			{\zihao{-3}\bfseries\l__cmcthesis_title_name_tl\thinspace{\thinspace \bfseries\uppercase\expandafter\thinspace} 
			{\zihao{-3}\heiti \l__cmcthesis_title_subname_tl}\\
			{\zihao{-4}\l__cmcthesis_title_date_tl}\\
			{\zihao{-4} \bfseries \l__cmcthesis_title_author_tl}\\
		\end{center}
		\begin{center}
			{考试形式：\underline{~闭卷~}~\hspace{2mm}考试时间：\underline{~~150~~}分钟~\hspace{2mm}满分：~\underline{~~100~~}~分}\\
		\end{center}
		\fi	
		\begin{center}
				%根据大题数目自动生成计分总表
			\newcounter{tc}
			\newcounter{tcsr}
			\setcounter{tc}{\value{ts}+3}
			\setcounter{tcsr}{\value{tc}-1}
			\arrayrulewidth=2\wol 
		\begin{tabular}{|m{3em}<{\centering}|*{11}{m{2.95em}<{\centering}|}}\hline
			题~号 & 一 & 二 & 三  & 四 & 五 &六 &七  &总~~分 \\\hline
			满~分 & 24 & 8 & 14  & 12 & 14  &14 &14 &100    \\\hline
			得~分 &    &   &     &    &     &   &  &\rule{0pt}{8mm} \\\hline
		\end{tabular}
		\end{center}
		\fbox{%
			\begin{minipage}[c][][c]{\textwidth}
				\vspace{1ex}
				\begin{center}
					{\bfseries \large{\bfseries 注\quad 意\quad 事\quad 项}}
				\end{center}
				{\bfseries 考生在答题前请认真阅读本注意事项及各题答题要求}
				\begin{enumerate}	
					\item
					所有答题都须写在试卷密封线右边,写在其他纸上一律无效．
					\item
					密封线左边请勿答题,密封线外不得有姓名及相关标记．
					\item
					如答题空白不够,可写在当页背面,并标明题号．
				\end{enumerate}
				\vspace{0.5ex}
			\end{minipage}%
		}%
		\vspace{2ex}
	}
	\group_end:
}
\keys_set:nn { cmcthesis} { 
	date    =,
	name    =,
	subname =,
	author  =, 
%	number = 1          ,
%	motto  = 微信公众号：八一考研数学竞赛
}


\NewDocumentEnvironment { material } { O{参考公式} m }
{{\bfseries #1：}#2} {}
\NewDocumentEnvironment {answer} { } {\par\ifcomm\comment\fi}{\ifcomm\endcomment\fi\par}


\DeclareDocumentCommand \cmcthesissetup{ m }
{
	\group_begin:
	\keys_set:nn {cmcthesis} { #1 }{
	}
	\group_end:
}
=======
%%%%%%%%%%%%%%%%%%%%%%
%% start of file `cmcthesis.cls`.
%% Copyright 2020-2021 Hoganbin (八一) and  Camuse (酸奶)
%%
%% This work may be distributed and/or modified freely
%% Last Modification 2019-08-17
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
% !TeX root = CMC.tex
\NeedsTeXFormat{LaTeX2e}
\RequirePackage[l2tabu,orthodox]{nag}
\RequirePackage{expl3,xparse,xtemplate,l3keys2e}
\ExplSyntaxOn
\ProvidesClass{cmcthesis}
\newif\ifennoto\ennotofalse
\newif\ifzhnoto\zhnotofalse
\newif\ifzhorigin\zhoriginfalse
\newif\ifmathfree\mathfreefalse
\newif\ifnewtxmath\newtxmathfalse

\keys_define:nn {cmcthesis} {
	hideanswer         .choice:           					,
	hideanswer         .default:n = false 					,
	hideanswer / false .code:n    = \newif\ifcomm\commfalse ,
	hideanswer / true  .code:n    = \newif\ifcomm\commtrue  ,
	
	enfont             .choice:                         ,	
	enfont             .default:n = empty               ,
	enfont / newtxtext .code:n    = \RequirePackage{#1} ,
	enfont / empty     .code:n    =                     ,
	enfont / noto      .code:n    = \ennototrue         ,
	
	zhfont           .choice:           ,	
	zhfont           .default:n = empty ,
	zhfont / empty   .code:n =                                            ,
	zhfont / mac     .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / macnew  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / macold  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / windows .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / ubuntu  .code:n = \PassOptionsToClass{fontset =#1} {ctexart} ,
	zhfont / zhnoto  .code:n = \PassOptionsToClass{fontset =none}{ctexart}
	\zhnototrue,
	zhfont / origin  .code:n = \PassOptionsToClass{fontset =none}{ctexart}
	\zhorigintrue,
	
	mathfont                .choice:           ,	
	mathfont                .default:n = empty ,
	mathfont / empty        .code:n    =       ,
	mathfont / newtxmath    .code:n    = \RequirePackage{#1} \newtxmathtrue ,
	mathfont / mtpro2       .code:n    = \RequirePackage{#1} ,
	mathfont / unicode-math .code:n    = \mathfreetrue       ,
}

\ProcessKeysOptions {cmcthesis}
\LoadClass [11pt, ] {ctexart} %twoside

\ifnewtxmath
\else
\RequirePackage{amsmath}
\fi
\RequirePackage
{
	CJKnumb	       ,
	enumerate      ,
	calc           , 
	intcalc        ,
	ifthen         ,
	zref-user      ,
	zref-lastpage  ,
	makecell       , 
	dashrule       ,
	parskip        ,
	esvect         ,
	cases          ,
	graphicx       ,
	paralist       ,
	enumitem       ,
	ulem           ,
	wrapfig        ,
	geometry       ,
	fancyhdr       ,
	lastpage       ,
	multicol       ,
	multirow	   ,
	array		   ,
	booktabs       ,
	verbatim       ,
	listings       ,
	accsupp        ,
	xcolor         ,
	tikz           ,
	interfaces-makecell,	
}

\ifennoto
\RequirePackage{noto}
\fi

\ifzhnoto
\setCJKmainfont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSerifCJKsc}
\setCJKsansfont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSansCJKsc}
\setCJKmonofont[
Extension          = .otf      ,
Path               = fonts/    ,
UprightFont        = *-Regular ,
BoldFont           = *-Bold    ,
ItalicFont         = *-Regular ,
BoldItalicFont     = *-Bold    ,
ItalicFeatures     = FakeSlant ,
BoldItalicFeatures = FakeSlant] {NotoSansMonoCJKsc}  
\fi


\ifzhorigin

\fontspec_font_if_exist:nTF {HYShuSongErJ}{
	\setCJKmainfont{HYShuSongErJ}%\rmfamily
	\setCJKfamilyfont{zhsong}{HYShuSongErJ}
}{
	\setCJKmainfont[Path=fonts/,]{HYShuSongErJ}%\rmfamily
	\setCJKfamilyfont{zhsong}[Path=fonts/,]{HYShuSongErJ}
}

\fontspec_font_if_exist:nTF {HYZhongHeiS}{
	\setCJKsansfont{HYZhongHeiS}%\sffamily
	\setCJKfamilyfont{zhhei}{HYZhongHeiS}% 细黑、黑体（同 sans）
}{
	\setCJKsansfont[Path=fonts/,]{HYZhongHeiS}
	\setCJKfamilyfont{zhhei}[Path=fonts/,]{HYZhongHeiS}
}

\fontspec_font_if_exist:nTF {HYFangSongS}{
	\setCJKmonofont{HYFangSongS}%\ttfamily
	\setCJKfamilyfont{zhhei}{HYFangSongS}% 仿宋（同 mono）
}{
	\setCJKmonofont[Path=fonts/,]{HYFangSongS}
	\setCJKfamilyfont{zhhei}[Path=fonts/,]{HYFangSongS}
}

\fontspec_font_if_exist:nTF {HYKaiTiS}{
	\setCJKfamilyfont{zhkai}{HYKaiTiS} % 楷体
}{
	\setCJKfamilyfont{zhkai}[Path=fonts/,]{HYKaiTiS}
}

\fontspec_font_if_exist:nTF {HYDaSongJ}{
	\setCJKfamilyfont{bs}{HYDaSongJ}% 标song
}{
	\setCJKfamilyfont{bs}[Path=fonts/,]{HYDaSongJ}
}
\setCJKfamilyfont{kd}{华文行楷}
\def\heiti{\CJKfamily{zhhei}}
\def\songti{\CJKfamily{zhsong}}
\def\fangsong{\CJKfamily{zhfs}}
\def\kaishu{\CJKfamily{zhkai}}
\def\bs{\CJKfamily{bs}}
\fi

\ifmathfree
\RequirePackage{unicode-math}
\fi
\setlength { \multicolsep	 } { 0.00 pt }
\setlength { \abovetopsep	 } { 0.00 ex } 
\setlength { \belowrulesep	 } { 0.00 ex }
\setlength { \aboverulesep   } { 0.00 ex } 
\setlength { \belowbottomsep } { 0.00 ex }
\setlength { \heavyrulewidth } { 0.08 em }

\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}

\geometry{	
	paperheight = 270mm ,
	paperwidth	= 210mm ,
	left		= 30mm  ,
	right		= 25mm  ,
	top			= 20mm  ,
	bottom      = 20mm  ,
	headsep     = 10.0 pt ,
}  
\graphicspath{{image/}}

\lstdefinestyle{lfonts}{
	basicstyle   = \footnotesize\ttfamily         ,
	stringstyle  = \color{purple}                 ,
	keywordstyle = \color{blue!60!black}\bfseries ,
	commentstyle = \color{olive}\scshape		  ,
}
\lstdefinestyle{lnumbers}{
	numbers     = left  ,
	numberstyle = \tiny ,
	numbersep   = 1em	,
	firstnumber = 1		,
	stepnumber  = 1		,
}
\lstdefinestyle{llayout}{
	breaklines       = true		,
	tabsize          = 2		,
	columns          = flexible ,
}
\lstdefinestyle{lgeometry}{
	xleftmargin      = 20pt		,
	xrightmargin     = 0pt		,
	frame            = tb		,
	framesep         = \fboxsep ,
	framexleftmargin = 20pt		,
}
\lstdefinestyle{lgeneral}{
	style = lfonts	  ,
	style = lnumbers  ,
	style = llayout	  ,
	style = lgeometry ,
}
\lstdefinestyle{c}{
	language = {c}      ,
	style    = lgeneral ,
}

\newcommand{\noncopynumber}[1]{%
	\BeginAccSupp{method=escape,ActualText={}}%
	#1%
	\EndAccSupp{}%
}

\lstdefinestyle{tex}{
	language={[LaTeX]TeX},
	numbers=left,
	numbersep=1em,
	numberstyle=\tiny\noncopynumber,
	frame=single,
	framesep=\fboxsep,
	framerule=\fboxrule,
	rulecolor=\color{cyan},
	xleftmargin=\dimexpr\fboxsep+\fboxrule\relax,
	xrightmargin=\dimexpr\fboxsep+\fboxrule\relax,
	breaklines=true,
	basicstyle=\small\tt,
	keywordstyle=\color{blue},
	commentstyle=\color[rgb]{0.13,0.54,0.13},
	%backgroundcolor=\color{yellow!10},
	tabsize=2,
	columns=flexible,
	morekeywords={maketitle},
	escapeinside={\%LISTING:}{\^^M},
	breaklines= true,
}
%用到的长度变量
\newlength{\wot}
\newlength{\wol}
\newlength{\gmw}
\newlength{\dl}

%长度变量的初始值
\settowidth{\wot}{复核人}
\setlength{\wol}{0.3pt}
\setlength{\gmw}{6em}
\setlength{\dl}{10em}

\renewcommand{\baselinestretch}{1.5}

%页眉设置开始
\renewcommand{\headrulewidth}{0pt}


%页脚设置开始
\fancyfoot[C]{\bfseries \ifcomm CMC试题\else 参考解答\fi \quad 第{\sffamily\thepage} 页 (共~{\sffamily\pageref{LastPage}}~页)}
\newcounter{ns}
\newcounter{ts}
\newcounter{nq}
\newcommand{\wns}{\stepcounter{ns}\CJKnumber{\thens}、}
\newcommand{\wq}{\stepcounter{nq}\thenq.}



%大题前计分表格
\newcommand{\tbs}{\begin{tabular}{|c|c|c|}\hline \makebox[\wot]{得分}&\makebox[\wot]{评卷人}&\makebox[\wot]{复核人}\\ \hline
		& &\\ \hline\end{tabular}}

%排版大题前计分表格,序号,题型,大题说明
\newcommand{\ws}[2]{\raisebox{-1ex}
	{\begin{minipage}[b]{4.6\wot}\tbs\end{minipage}}
	\begin{minipage}[t]{\textwidth-6\wot} 
		{\heiti \wns #1 } #2 \end{minipage}
}
\makeatletter
\zref@newprop{totalsections}[3]{\arabic{ns}}
\zref@addprop{LastPage}{totalsections}
\AtBeginDocument{
	\setcounter{ts}{\zref@extractdefault{LastPage}{totalsections}{3}} }
\makeatother
\linespread{1.618}
\newcommand{\D}{\,\mathrm{d}}
\newcommand{\E}{\mathrm{e}}
\newcommand{\dlim}{\displaystyle \lim }
\newcommand{\dint}{\displaystyle \int }
\newcommand{\sets}[1]{\{ #1 \}}


\pagestyle{fancy}

%装订线开始
\fancyheadoffset[OL,ER]{\gmw}
\fancyhead[OL]{
	\ifnum\intcalcMod{\value{page}}{4}=1
	\rotatebox{90}
	{\begin{minipage}{1.1\textheight}
			\begin{center}
				省市：\rule[-.2ex]{\dl}{\wol} 学校：\rule[-.2ex]{\dl}{\wol}  姓名：\rule[-.2ex]{\dl}{\wol} 准考证号：\rule[-.2ex]{\dl}{\wol}\\
				\tiny \hdashrule[-3ex]{\textheight}{\wol}{3pt}\\[\smallskipamount]
				\makebox[0.6\textheight][s]{装订线内不要答题}\\[-3\smallskipamount]
				\hdashrule[-3ex]{\textheight}{\wol}{3pt}
			\end{center}
	\end{minipage} }
	\fi
}
\fancyhead[ER]{
	\ifnum\intcalcMod{\value{page}}{4}=0
	\rotatebox{-90}
	{\begin{minipage}{1.1\textheight}
			\begin{center}
				\tiny \hdashrule[-3ex]{\textheight}{\wol}{3pt}\\[\smallskipamount]
				\makebox[0.6\textheight][s]{装订线内不要答题}\\[-3\smallskipamount]
				\hdashrule[-3ex]{\textheight}{\wol}{3pt}
			\end{center}
	\end{minipage} }
	\fi
}
%装订线结束

%选择题选项的排法
\newcommand{\onech}[4]{\makebox[3.2cm][l]{A.~#1}\makebox[3.2cm][l]{B.~#2}\makebox[3.2cm][l]{C.~#3}\makebox[3.2cm][l]{D.~#4}}%一行
\newcommand{\twoch}[4]{\makebox[6.4cm][l]{A.~#1}\makebox[6.4cm][l]{B.~#2}\\ \makebox[6.4cm][l]{C.~#3}\makebox[6.4cm][l]{D.~#4}}%两行

%分数线延长
\newcommand{\zfrac}[2]{\dfrac{{\raisebox{-0.6mm}{$#1$}}}{\;{ \raisebox{0.2mm} {$#2$}}\;}}

%三角形
\newcommand{\sjx}{\raisebox{0.7ex} {$_{\triangle}$}}

%直立积分号，需要mathabx宏包
\makeatletter
\def\upintkern@{\mkern-7mu\mathchoice{\mkern-2mu}{}{}{}}
\def\upintdots@{\mathchoice{\mkern-4mu\@cdots\mkern-4mu}%
	{{\cdotp}\mkern1.5mu{\cdotp}\mkern1.5mu{\cdotp}}%
	{{\cdotp}\mkern1mu{\cdotp}\mkern1mu{\cdotp}}%
	{{\cdotp}\mkern1mu{\cdotp}\mkern1mu{\cdotp}}}
\newcommand{\upiint}{\DOTSI\protect\UpMultiIntegral{2}}
\newcommand{\upiiint}{\DOTSI\protect\UpMultiIntegral{3}}
\newcommand{\upiiiint}{\DOTSI\protect\UpMultiIntegral{4}}
\newcommand{\upidotsint}{\DOTSI\protect\UpMultiIntegral{0}}
\newcommand{\UpMultiIntegral}[1]{%
	\edef\ints@c{\noexpand\upintop
		\ifnum#1=\z@\noexpand\upintdots@\else\noexpand\upintkern@\fi
		\ifnum#1>\tw@\noexpand\upintop\noexpand\upintkern@\fi
		\ifnum#1>\thr@@\noexpand\upintop\noexpand\upintkern@\fi
		\noexpand\upintop
		\noexpand\ilimits@
	}%
	\futurelet\@let@token\ints@a
}
\makeatother

\DeclareFontFamily{U}{mathx}{\hyphenchar\font45}
\DeclareFontShape{U}{mathx}{m}{n}{
	<->s * [0.8]
	mathx10
}{}
\DeclareSymbolFont{mathx}{U}{mathx}{m}{n}
\DeclareFontSubstitution{U}{mathx}{m}{n}
\DeclareMathSymbol{\upintop}{\mathop}{mathx}{'273}
%\DeclareMathSymbol{\upiint}{\mathop}{mathx}{'274}
%\DeclareMathSymbol{\upiiint}{\mathop}{mathx}{'275}
\DeclareMathSymbol{\upointop}{\mathop}{mathx}{'276}
\DeclareMathSymbol{\upoiint}{\mathop}{mathx}{'277}
\makeatletter
\newcommand{\upint}{\DOTSI\upintop\ilimits@}
\newcommand{\upoint}{\DOTSI\upointop\ilimits@}



\ifnewtxmath
\else
\DeclareFontEncoding { LS2 } { } { \noaccents@ }
\DeclareMathRadical  { \sqrtsign } {symbols} { 112 } {largesymbols} { 112 }

\SetSymbolFont { symbols      } { bold } { OMS } { mdput } { bx } { n }
\SetSymbolFont { largesymbols } { bold } { OMX } { mdput } { bx } { n }

\DeclareFontSubstitution { OMS } { mdput } { m } { n }
\DeclareFontSubstitution { OMX } { mdput } { m } { n }
\DeclareFontSubstitution { LS2 } { stix  } { m } { n }

\DeclareSymbolFont { symbols      } { OMS } { mdput   } { m } { n }
\DeclareSymbolFont { largesymbols } { OMX } { mdput   } { m } { n }
\DeclareSymbolFont { integrals    } { LS2 } { stixcal } { m } { n }

\DeclareMathSymbol { \intupop                } { \mathop } { integrals } { "AF }
\DeclareMathSymbol { \iintupop               } { \mathop } { integrals } { "B0 }
\DeclareMathSymbol { \iiintupop              } { \mathop } { integrals } { "B1 }
\DeclareMathSymbol { \ointupop               } { \mathop } { integrals } { "B2 }
\DeclareMathSymbol { \oiintupop              } { \mathop } { integrals } { "B3 }
\DeclareMathSymbol { \oiiintupop             } { \mathop } { integrals } { "B4 }
\DeclareMathSymbol { \intclockwiseupop       } { \mathop } { integrals } { "B5 }
\DeclareMathSymbol { \varointclockwiseupop   } { \mathop } { integrals } { "B6 }
\DeclareMathSymbol { \ointctrclockwiseupop   } { \mathop } { integrals } { "B7 }
\DeclareMathSymbol { \sumintupop             } { \mathop } { integrals } { "B8 }
\DeclareMathSymbol { \iiiintupop             } { \mathop } { integrals } { "B9 }
\DeclareMathSymbol { \intbarupop             } { \mathop } { integrals } { "BA }
\DeclareMathSymbol { \intBarupop             } { \mathop } { integrals } { "BB }
\DeclareMathSymbol { \fintupop               } { \mathop } { integrals } { "BC }
\DeclareMathSymbol { \cirfnintupop           } { \mathop } { integrals } { "BD }
\DeclareMathSymbol { \awintupop              } { \mathop } { integrals } { "BE }
\DeclareMathSymbol { \rppolintupop           } { \mathop } { integrals } { "BF }
\DeclareMathSymbol { \scpolintupop           } { \mathop } { integrals } { "C0 }
\DeclareMathSymbol { \npolintupop            } { \mathop } { integrals } { "C1 }
\DeclareMathSymbol { \pointintupop           } { \mathop } { integrals } { "C2 }
\DeclareMathSymbol { \sqintupop              } { \mathop } { integrals } { "C3 }
\DeclareMathSymbol { \intlarhkupop           } { \mathop } { integrals } { "C4 }
\DeclareMathSymbol { \intxupop               } { \mathop } { integrals } { "C5 }
\DeclareMathSymbol { \intcapupop             } { \mathop } { integrals } { "C6 }
\DeclareMathSymbol { \intcupupop             } { \mathop } { integrals } { "C7 }
\DeclareMathSymbol { \upintupop              } { \mathop } { integrals } { "C8 }
\DeclareMathSymbol { \lowintupop             } { \mathop } { integrals } { "C9 }
\fi

\XeTeXdefaultencoding "UTF-8"
\lineskiplimit=5.5pt
\lineskip=10pt

% cover
%\ExplSyntaxOn
\tl_new:N \l__cmcthesis_title_date_tl
\tl_new:N \l__cmcthesis_title_name_tl
\tl_new:N \l__cmcthesis_title_subname_tl
\tl_new:N \l__cmcthesis_title_author_tl
\tl_new:N \l__cmcthesis_title_motto_tl
\keys_define:nn { cmcthesis }
{
	date    .tl_set:N = \l__cmcthesis_title_date_tl   ,
	name    .tl_set:N = \l__cmcthesis_title_name_tl   ,
	subname .tl_set:N = \l__cmcthesis_title_subname_tl   ,
	author  .tl_set:N = \l__cmcthesis_title_author_tl  ,
	motto   .tl_set:N = \l__cmcthesis_title_motto_tl  ,
}
%art
\DeclareDocumentCommand \cmcthesistitle { m }
{
	\group_begin:
	\keys_set:nn { cmcthesis } { #1 }{
		{\noindent\sffamily 
			{
				{
				\heiti 绝密 $\bigstar$ 启用前
				} 
				\hfill 
				{
					\heiti \l__cmcthesis_title_motto_tl
%				\tikz\node{};
					%\includegraphics[width=0.05\textwidth]{logo.pdf}
				}
			} 	
		}\par
		\ifzhorigin
		\begin{center}
			{\xingkai  \zihao{3}\l__cmcthesis_title_name_tl }\\
%			{\zihao{-3}\heiti\l__cmcthesis_title_name_tl\thinspace{\thinspace \bf\uppercase\expandafter\thinspace} 
		{\zihao{-3}  \heiti  数学类\thinspace \ifcomm\else 答案\fi}\\
			\zihao{-3}\l__cmcthesis_title_date_tl\\
			
		\end{center}
		\else
		\begin{center}
			{\bfseries\zihao{3}\l__cmcthesis_title_name_tl}\\
%			{\zihao{-3}\bfseries\l__cmcthesis_title_name_tl\thinspace{\thinspace \bfseries\uppercase\expandafter\thinspace} 
			{\zihao{-3}\heiti \l__cmcthesis_title_subname_tl}\\
			{\zihao{-4}\l__cmcthesis_title_date_tl}\\
			{\zihao{-4}  \l__cmcthesis_title_author_tl}\\
		\end{center}
		\begin{center}
			{考试形式：\underline{~闭卷~}~\hspace{2mm}考试时间：\underline{~~150~~}分钟~\hspace{2mm}满分：~\underline{~~100~~}~分}\\
		\end{center}
		\fi	
		\begin{center}
				%根据大题数目自动生成计分总表
			\newcounter{tc}
			\newcounter{tcsr}
			\setcounter{tc}{\value{ts}+3}
			\setcounter{tcsr}{\value{tc}-1}
			\arrayrulewidth=2\wol 
		\begin{tabular}{|m{3.8em}<{\centering}|*{11}{m{3.3em}<{\centering}|}}\hline
			题~号 & 一 & 二 & 三  & 四 & 五 &六 &七  &总~~分 \\\hline
			满~分 & 24 & 8 & 14  & 12 & 14  &14 &14 &100    \\\hline
			得~分 &    &   &     &    &     &   &  &\rule{0pt}{8mm} \\\hline
		\end{tabular}
		\end{center}
		\fbox{%
			\begin{minipage}[c][][c]{\textwidth}
				\vspace{1ex}
				\begin{center}
					{\bfseries \large{\bfseries 注\quad 意\quad 事\quad 项}}
				\end{center}
				{\bfseries 考生在答题前请认真阅读本注意事项及各题答题要求}
				\begin{enumerate}	
					\item
					所有答题都须写在试卷密封线右边,写在其他纸上一律无效．
					\item
					密封线左边请勿答题,密封线外不得有姓名及相关标记．
					\item
					如答题空白不够,可写在当页背面,并标明题号．
				\end{enumerate}
				\vspace{0.5ex}
			\end{minipage}%
		}%
		\vspace{2ex}
	}
	\group_end:
}
\keys_set:nn { cmcthesis} { 
	date    =,
	name    =,
	subname =,
	author  =, 
%	number = 1          ,
%	motto  = 微信公众号：八一考研数学竞赛
}


\NewDocumentEnvironment { material } { O{参考公式} m }
{{\bfseries #1：}#2} {}
\NewDocumentEnvironment {answer} { } {\par\ifcomm\comment\fi}{\ifcomm\endcomment\fi\par}


\DeclareDocumentCommand \cmcthesissetup{ m }
{
	\group_begin:
	\keys_set:nn {cmcthesis} { #1 }{
	}
	\group_end:
}
>>>>>>> 74b4bb6 (update)
