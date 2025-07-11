---
date: "2025-07-11T14:00:28Z"
title: cat
summary: "Display file contents from a Plakar snapshot"
---
<table class="head">
  <tr>
    <td class="head-ltitle">PLAKAR-CAT(1)</td>
    <td class="head-vol">General Commands Manual</td>
    <td class="head-rtitle">PLAKAR-CAT(1)</td>
  </tr>
</table>
<div class="manual-text">
<section class="Sh">
<h1 class="Sh" id="NAME"><a class="permalink" href="#NAME">NAME</a></h1>
<p class="Pp"><code class="Nm">plakar-cat</code> &#x2014;
    <span class="Nd">Display file contents from a Plakar snapshot</span></p>
</section>
<section class="Sh">
<h1 class="Sh" id="SYNOPSIS"><a class="permalink" href="#SYNOPSIS">SYNOPSIS</a></h1>
<table class="Nm">
  <tr>
    <td><code class="Nm">plakar cat</code></td>
    <td>[<code class="Fl">-no-decompress</code>]
      [<code class="Fl">-highlight</code>]
      <var class="Ar">snapshotID</var>:<var class="Ar">path ...</var></td>
  </tr>
</table>
</section>
<section class="Sh">
<h1 class="Sh" id="DESCRIPTION"><a class="permalink" href="#DESCRIPTION">DESCRIPTION</a></h1>
<p class="Pp">The <code class="Nm">plakar cat</code> command outputs the
    contents of <var class="Ar">path</var> within Plakar snapshots to the
    standard output. It can decompress compressed files and optionally apply
    syntax highlighting based on the file type.</p>
<p class="Pp">The options are as follows:</p>
<dl class="Bl-tag">
  <dt id="no-decompress"><a class="permalink" href="#no-decompress"><code class="Fl">-no-decompress</code></a></dt>
  <dd>Display the file content as-is, without attempting to decompress it, even
      if it is compressed.</dd>
  <dt id="highlight"><a class="permalink" href="#highlight"><code class="Fl">-highlight</code></a></dt>
  <dd>Apply syntax highlighting to the output based on the file type.</dd>
</dl>
</section>
<section class="Sh">
<h1 class="Sh" id="EXAMPLES"><a class="permalink" href="#EXAMPLES">EXAMPLES</a></h1>
<p class="Pp">Display a file's contents from a snapshot:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar cat abc123:/etc/passwd</pre>
</div>
<p class="Pp">Display a file with syntax highlighting:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar cat -highlight abc123:/home/op/korpus/driver.sh</pre>
</div>
</section>
<section class="Sh">
<h1 class="Sh" id="DIAGNOSTICS"><a class="permalink" href="#DIAGNOSTICS">DIAGNOSTICS</a></h1>
<p class="Pp">The <code class="Nm">plakar-cat</code> utility exits&#x00A0;0 on
    success, and&#x00A0;&gt;0 if an error occurs.</p>
<dl class="Bl-tag">
  <dt>0</dt>
  <dd>Command completed successfully.</dd>
  <dt>&gt;0</dt>
  <dd>An error occurred, such as failure to retrieve a file or decompress
      content.</dd>
</dl>
</section>
<section class="Sh">
<h1 class="Sh" id="SEE_ALSO"><a class="permalink" href="#SEE_ALSO">SEE
  ALSO</a></h1>
<p class="Pp"><a class="Xr" href="../plakar/">plakar(1)</a>,
    <a class="Xr" href="../plakar-backup/">plakar-backup(1)</a></p>
</section>
</div>
<table class="foot">
  <tr>
    <td class="foot-date">July 3, 2025</td>
    <td class="foot-os">Plakar</td>
  </tr>
</table>
