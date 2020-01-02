### 全国大学生数学竞赛模板使用说明

___

为了方便统一 `\LaTeX` 格式，故八一和酸奶推出此模板。为了能够简单入门该文档，请阅读该说明文档。方便模板的更新与维护，个人的配置放到 `settings.tex` 文件中，这样更新模板是只需替换旧的 `cmcthesis.cls` 文件即可。自己的 `settings.tex` 文件保留。

首先是设置文档的开头选项

```
\documentclass[
	hideanswer=false,
	enfont=newtxtext,
	zhfont=empty,
	mathfont=newtxmath,
]{cmcthesis}
```

`hideanswer=false,true` 两个选项可以选择一个。它决定了`answer`环境里面的内容是否显示，以及开头的说明和页脚的内容。

在 `hideanswer=true` 的选择下，则在`answer` 环境里设置的答案是不会显示的，但是 `hideanswer=false` 的选择下是会出现的。该选项旨在让试题和答案在同一文档中，而不需要切换文档。

对于` enfont` 选项在`newtxtext,noto,empty`中选一个，决定使用的英文字体。如果不喜欢用 `newtxtext` 和 `noto` ，可以选择 `empty` 使用原始的配置。当且仅当使用 `empty` 选项时指定字体才不会造成奇怪的问题。使用之后可以用以下类似的语句在 `settings.tex` 指定英文字体。

```\begin{lstlisting}[style=tex]
\setmainfont{⟨font⟩}[⟨font features⟩]
\setsansfont{⟨font⟩}[⟨font features⟩]
\setmonofont{⟨font⟩}[⟨font features⟩]
\end{lstlisting}
```

中文字体的选择使用`zhfont` 来控制，可选方案有 `zhnoto,origin,empty` 。`zhnoto` 选项需要中文的 `noto`字体，可在群文件中下载,它与 `enfont=noto` 配合使用。下载的字体应该放在`font/`文件夹下以供使用。`origin`是八一的配置方案，开启它就是之前模板的设置，字体可以安装使用，或者放在当前文件夹或者 `font/`文件夹下面使用。如果启用的`empty` 选项，同理是用默认的设置，可以自己指定字体。用类似下面的方法指定：

```
\setCJKmainfont{⟨font⟩}[⟨font features⟩]
\setCJKsansfont{⟨font⟩}[⟨font features⟩]
\setCJKmonofont{⟨font⟩}[⟨font features⟩]
```

数学字体的选项用`mathfont`选项进行控制，可选择的有`newtxmath,unicode-math,` `mtpro2,empty`四个。`newtxmath` 是与 `enfont=newtxtext`配合使用的。如果使用 `mtpro2`选项请自行安装该宏包。如果使用 `unicode-math` 或者 `empty` 选项可以自行指定字体方案。`empty` 的自由度更高。使用 `unicode-math` 选项可以使用以下命令配置数学字体：

```
\setmathfont{⟨font⟩}[⟨font features⟩]
```

如果想在试卷开头给出一些参考公式或者其它参考资料可以使用 `material`环境，使用示例如下：

```
\begin{material}%[参考资料] %可选参数，可以改变默认的 “参考公式” 四个字
参考的内容啊
\end{material}
```



#### 需要说明 `CMC` 试题样式要内容构成：

1. 长度变量
2. 页眉设置
3. 装订线
4. 页脚设置
5. 大题前计分表格
6. 排版大题前计分表格,序号,题型,大题说明
7. 直立积分号，需要`mathabx`宏包
8. `cover`的设计

有需要的用到同学可供下载使用。

___

#### 使用说明

- 行内行间数学公式统一的话可用`\everymath{\displaystyle}`
- 需要自己手动添加的配置可放在`settings.tex`
- 模板有什么问题可我联系hoganbin1995@outlook.com

