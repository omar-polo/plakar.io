---
date: "2025-07-11T14:00:28Z"
title: diff
summary: "Show differences between files in a Plakar snapshots"
---
<table class="head">
  <tr>
    <td class="head-ltitle">PLAKAR-DIFF(1)</td>
    <td class="head-vol">General Commands Manual</td>
    <td class="head-rtitle">PLAKAR-DIFF(1)</td>
  </tr>
</table>
<div class="manual-text">
<section class="Sh">
<h1 class="Sh" id="NAME"><a class="permalink" href="#NAME">NAME</a></h1>
<p class="Pp"><code class="Nm">plakar-diff</code> &#x2014; <span class="Nd">Show
    differences between files in a Plakar snapshots</span></p>
</section>
<section class="Sh">
<h1 class="Sh" id="SYNOPSIS"><a class="permalink" href="#SYNOPSIS">SYNOPSIS</a></h1>
<table class="Nm">
  <tr>
    <td><code class="Nm">plakar diff</code></td>
    <td>[<code class="Fl">-highlight</code>]
      <var class="Ar">snapshotID1</var>[:<var class="Ar">path1</var>]
      <var class="Ar">snapshotID2</var>[:<var class="Ar">path2</var>]</td>
  </tr>
</table>
</section>
<section class="Sh">
<h1 class="Sh" id="DESCRIPTION"><a class="permalink" href="#DESCRIPTION">DESCRIPTION</a></h1>
<p class="Pp">The <code class="Nm">plakar diff</code> command compares two
    Plakar snapshots, optionally restricting to specific files within them. If
    only snapshot IDs are provided, it compares the root directories of each
    snapshot. If file paths are specified, the command compares the individual
    files. The diff output is shown in unified diff format, with an option to
    highlight differences.</p>
<p class="Pp">The options are as follows:</p>
<dl class="Bl-tag">
  <dt id="highlight"><a class="permalink" href="#highlight"><code class="Fl">-highlight</code></a></dt>
  <dd>Apply syntax highlighting to the diff output for readability.</dd>
</dl>
</section>
<section class="Sh">
<h1 class="Sh" id="EXAMPLES"><a class="permalink" href="#EXAMPLES">EXAMPLES</a></h1>
<p class="Pp">Compare root directories of two snapshots:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar diff abc123 def456</pre>
</div>
<p class="Pp">Compare across snapshots with highlighting:
    <span class="Pa">/etc/passwd</span></p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar diff -highlight abc123:/etc/passwd def456:/etc/passwd</pre>
</div>
</section>
<section class="Sh">
<h1 class="Sh" id="DIAGNOSTICS"><a class="permalink" href="#DIAGNOSTICS">DIAGNOSTICS</a></h1>
<p class="Pp">The <code class="Nm">plakar-diff</code> utility exits&#x00A0;0 on
    success, and&#x00A0;&gt;0 if an error occurs.</p>
<dl class="Bl-tag">
  <dt>0</dt>
  <dd>Command completed successfully.</dd>
  <dt>&gt;0</dt>
  <dd>An error occurred, such as invalid snapshot IDs, missing files, or an
      unsupported file type.</dd>
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
