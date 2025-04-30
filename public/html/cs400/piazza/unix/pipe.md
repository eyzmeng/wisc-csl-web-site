---
# I am lazy, so I am generating this entirely with pandoc(1)
title: Unix Pipeline resources
lang: en
---

Hey hey hey did someone mention *the* [Unix **pipe**line**s**](https://www.youtube.com/watch?v=bKzonnwoR2I)? You could use some... *resources*. :\)

P.S. Since you tagged "exam" I will definitely not be in the position to answer this; but that hasn't stopped my urge to yap for the 100th++ time! (On second thought, I want this to be a wiki people can edit -- append, modify, or otherwise delete entirely -- so... I guess I am posting this as an answer. Sorry :\)

(Just don't tell me you are actually asking about the bitwise OR operator in Java... I actually kind of want to collect good stuff about pipe and [IPC](https://manpages.debian.org/bookworm/perl-doc/perlipc.1.en.html))

(Also fun fact: If you search for "pipes" in Piazza, 2/3 posts/threads are mine just about that. This will make it a fourth post... \:D)

#0 The manuals (highly technical, but... useful to remember that they exist.)

* GNU Bash **bash**(1): [[man page](https://manpages.debian.org/bookworm/bash/bash.1.en.html#Pipelines)] [[info page](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html)]
* The POSIX Bourne shell **sh**(1): [[POSIX.1-2024](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_09_02)]

#1 Friendly guides (the ones that are most likely to help)

* [Advanced Topics &gt; Pipe](https://web.archive.org/web/20080318231951/http://www.cs.wisc.edu/csl/cs1000/node56.html): **from CS1000**, a Unix manual that used to live **[right here on CSL](https://web.archive.org/web/20080602103734/http://www.cs.wisc.edu/csl/cs1000/cs1000.html)** in 2008 ([*not* factorial](https://www.reddit.com/r/unexpectedfactorial/comments/1g3nrzd/if_i_live_100_years_i_will_see_year_41410%E2%81%B9%C2%B9%C2%B3%E2%81%B0/))! (Retrieved via Internet Archive as the links now redirect to [CSL docs](https://csl.cs.wisc.edu/) -- I know. sadge. i am literally depressed rn csl better bring it back /j)
* [Pipes: A Brief Introduction](https://www.linfo.org/pipe.html): from the [Linux Info Project](https://www.linfo.org/index.html). Includes a nice history lesson too (the HTML seems a bit messed up but it should be okay.)
* [Special characters](https://tldp.org/LDP/abs/html/special-chars.html) (search downward for "UNIX pipe"; unfortunately I can't make a direct link there): you would be very delighted to hear about [The Linux Document Project](https://tldp.org/) and how they have Bash programming tutorials (this one comes from [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/); there is also [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/))
* [BashProgramming &gt; Commands and Quoting](https://mywiki.wooledge.org/BashProgramming#Commands_and_Quoting): explained in three brief sentences, but I thought it'd be *obligatory* that I include [Greycat's Wiki](https://mywiki.wooledge.org/) *somewhere*. There is [a very nice FAQ](https://mywiki.wooledge.org/BashFAQ/024) *related* to pipe, for instance -- namely the subtle fact that pipelines are executed in a subshell. Here are [some complements](https://news.ycombinator.com/item?id=29747472) from people other than me to justify this inclusion.
* Watch Brian Kernighan (one the living legends from Bell Labs) explain!!! [Here (AT&T archives)](https://www.youtube.com/watch?v=tc4ROCJYbm0&t=330) (and [that first link](https://www.youtube.com/watch?v=bKzonnwoR2I) of this post is secretly a video too... (I will be infinitely grateful for Computerphile inviting him over for talks qvq))
* [Bourne Shell Tutorial &gt; Simple Control Flow](https://www.grymoire.com/Unix/Bourne.html#uh-73): very well-paced from what I can tell; written by [Bruce Barnett](https://www.grymoire.com/About.html#Bruce_Barnett). I know him because I was looking for a C Shell tutorial and stumbled upon [this gold](https://www.grymoire.com/Unix/Csh.html) (the prologue right after the TOC gave me good chuckles -- ah... takes me back to the good old days when I looked into @137 and there weren't two thousand Piazza posts \:) And [greycat](https://mywiki.wooledge.org/Idiot#SpaceBass_vs._greycat) helped me remember the web site -- thanks greycat!

#2.5 Some less directly useful, but more fun resources

* [Pipe Practices](https://stevens.netmeister.org/631/pp/): I was today years old when I learned that a "[UNIX Pipe Card Game](https://punkx.org/unix-pipe-game/)" exists. O_O (And [oh](https://news.ycombinator.com/item?id=41048894), [oh man](https://punkx.org/4917/), it gets so much crazier... (And I thought _Computer Engineering for Babies_ was crazy enough, wow...)

* Useless Use of Cat (UUOC): This is just something nice to know. (Plus you can learn from the examples!) [[wikipedia](https://en.wikipedia.org/wiki/Cat_%28Unix%29#Useless_use_of_cat)] [[shellcheck SC2002](https://www.shellcheck.net/wiki/SC2002)]

#3 Advanced (For the adventurous [warriors](https://bsky.app/profile/warriorkittys.bsky.social))

Those of you who love C/Unix.... this is for you. (I am not aware of the size of the set of people who fit the criteria, but I know (as a matter of fact) its cardinality is strictly greater than 0 (I mean, me -- I love C/Unix, is that not obvious enough? These are resources for *me* even if none of *you* will read them! Ha! >:D))

* ["How are Unix Pipes implemented?" on HN](https://news.ycombinator.com/item?id=22704774) links to so many gems at once. But in *particular*... I like:
  - [Pipes, Forks, & Dups: Understanding Command Execution and Input/Output Data Flow](https://www.rozmichelle.com/pipes-forks-dups/)
by [Roslyn McConnell](https://www.rozmichelle.com/author/rozroz/) (very, very, *very* clean diagrams. I don't think I've seen cleaner diagrams than this...)
  - [This comment](https://news.ycombinator.com/item?id=22706876) on how Doug McIlory initially conceived the Unix pipeline seems interesting.
* [Rethinking the shell pipeline](https://blogs.gnome.org/alexl/2012/08/10/rethinking-the-shell-pipeline/) (and [related HN thread](https://news.ycombinator.com/item?id=4368993)): for those of you who use Windows, this is for you -- because this is precisely what **Powershell** is about! Most specifically, its ["Objected-oriented" approach to pipelines](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-7.5), rather than the text/bytestream/file-based interface in Unix. I don't want to give you my opinion or tell you what to think; but there are some good arguments for and against this modern re-thinking of shell pipelines both in the blog comments and in HN; and in doing so we are putting Unix pipelines in a bigger context... critical thinking! (If you want to dig an even deeper hole than I did, I heard that the designer of Powershell wrote this thing called [Monad Manifesto](https://www.jsnover.com/blog/2011/10/01/monad-manifesto/)...)
* [Pipes and FIFOs](https://www.youtube.com/watch?v=mq5G33Sbc_o&list=PL0qfF8MrJ-jxMfirAdxDs9zIiBg2Wug0z&index=51): this is just raw C programming. Here he talks about [**pipe**(2)](https://man.netbsd.org/pipe.2) and [**mkfifo**(2)](https://man.netbsd.org/mkfifo.2). (You know things are serious from the [man page section](https://web.archive.org/web/20080604003140/http://www.cs.wisc.edu/csl/cs1000/node51.html) alone: it's not a command in section 1 (commands), not a function in section 3 (library subroutines), but a function in **section 2** (*system calls*) -- as close as it gets to the OS itself!)

  A note to people who plan to read the man pages in their terminal: you will need to specify the man page section for mkfifo because there is a synonymous page in section 1 (for the [**mkfifo**(1)](https://man.netbsd.org/mkfifo.1) *command*). So instead of this: `man mkfifo`, run this: `man 2 mkfifo`, or this: `man -S 2 mkfifo`. (Actually, for some mysterious reason, mkfifo is in section 3 on Debian and Arch Linux. so replace 2 with 3 if that doesn't work...)

* Since nothing is off-limits in this section
   (given that I marked it as "Advanced"), I can selfishly direct you to read the abomination I assembled with **sort**(1) | **head**(1) | [**column**(1)](https://man.archlinux.org/man/column.1.en.txt) | **sed**(1) in @724_f1. One thing I should add: I wouldn't use `cat -n` anymore because [**cat**(1) does too many things](https://news.ycombinator.com/item?id=22474362). But the awk alternative `awk '{print NR "\t" $0}'` Rob Pike and Brian Kernighan mention in "[Program Design in the UNIX Environment](https://harmful.cat-v.org/cat-v/unix_prog_design.pdf)" isn't much prettier IMO. So imagine my delight when I [discovered](https://www.youtube.com/watch?v=8qPxQ3g8bso&t=165s) that **nl**(1) exists (both on [Linux](https://man.archlinux.org/man/nl.1.en.txt) and on [BSD](https://man.freebsd.org/cgi/man.cgi?query=nl&apropos=0&sektion=1&manpath=FreeBSD+15.0-CURRENT&arch=default&format=html). So now I use `nl -b a` (sometimes I squeeze the flag and option, but I'm not sure how portable this form is: `nl -ba`) and never look back. (yippee! ^^)

* Oh you think I am done? (I kind of wish I am too, it *is* kind of late now...) But I've written another pipeline -- this time relevant to project 1, where I demonstrated two pipelines that basically replicated the whole project: [18:53](https://www.youtube.com/watch?v=EW-WQEJtvRs&t=1133). Pipelines are pretty cool if you think about it.

P.S. I am hosting a copy on [my CSL page](https://pages.cs.wisc.edu/~emeng/cs400/piazza/unix/pipes.html), in case you want something nicer to look at. (Idk about CS400, but my write-ups are [Creative Commons](https://pages.cs.wisc.edu/~emeng/cs400/piazza/); so it is open and you are free to share outside of Piazza (as is most of the resources I linked in this wiki-ish post).) If you make edits, I will add it to the page if you email me and I think it's good. You will be attributed unless you want to remain anonymous.
