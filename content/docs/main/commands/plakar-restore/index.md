---
date: "2025-07-11T14:02:28Z"
title: restore
summary: "Restore files from a Plakar snapshot"
---
<table class="head">
  <tr>
    <td class="head-ltitle">PLAKAR-RESTORE(1)</td>
    <td class="head-vol">General Commands Manual</td>
    <td class="head-rtitle">PLAKAR-RESTORE(1)</td>
  </tr>
</table>
<div class="manual-text">
<section class="Sh">
<h1 class="Sh" id="NAME"><a class="permalink" href="#NAME">NAME</a></h1>
<p class="Pp"><code class="Nm">plakar-restore</code> &#x2014;
    <span class="Nd">Restore files from a Plakar snapshot</span></p>
</section>
<section class="Sh">
<h1 class="Sh" id="SYNOPSIS"><a class="permalink" href="#SYNOPSIS">SYNOPSIS</a></h1>
<table class="Nm">
  <tr>
    <td><code class="Nm">plakar restore</code></td>
    <td>[<code class="Fl">-name</code> <var class="Ar">name</var>]
      [<code class="Fl">-category</code> <var class="Ar">category</var>]
      [<code class="Fl">-environment</code> <var class="Ar">environment</var>]
      [<code class="Fl">-perimeter</code> <var class="Ar">perimeter</var>]
      [<code class="Fl">-job</code> <var class="Ar">job</var>]
      [<code class="Fl">-tag</code> <var class="Ar">tag</var>]
      [<code class="Fl">-latest</code>] [<code class="Fl">-before</code>
      <var class="Ar">date</var>] [<code class="Fl">-since</code>
      <var class="Ar">date</var>] [<code class="Fl">-concurrency</code>
      <var class="Ar">number</var>] [<code class="Fl">-quiet</code>]
      [<code class="Fl">-rebase</code>] [<code class="Fl">-to</code>
      <var class="Ar">directory</var>]
      [<var class="Ar">snapshotID</var>:<var class="Ar">path ...</var>]</td>
  </tr>
</table>
</section>
<section class="Sh">
<h1 class="Sh" id="DESCRIPTION"><a class="permalink" href="#DESCRIPTION">DESCRIPTION</a></h1>
<p class="Pp">The <code class="Nm">plakar restore</code> command is used to
    restore files and directories at <var class="Ar">path</var> from a specified
    Plakar snapshot to the local file system. If <var class="Ar">path</var> is
    omitted, then all the files in the specified
    <var class="Ar">snapshotID</var> are restored. If no
    <var class="Ar">snapshotID</var> is provided, the command attempts to
    restore the current working directory from the last matching snapshot.</p>
<p class="Pp">The options are as follows:</p>
<dl class="Bl-tag">
  <dt id="name"><a class="permalink" href="#name"><code class="Fl">-name</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match
    <var class="Ar">name</var>.</dd>
  <dt id="category"><a class="permalink" href="#category"><code class="Fl">-category</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match
    <var class="Ar">category</var>.</dd>
  <dt id="environment"><a class="permalink" href="#environment"><code class="Fl">-environment</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match
      <var class="Ar">environment</var>.</dd>
  <dt id="perimeter"><a class="permalink" href="#perimeter"><code class="Fl">-perimeter</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match
      <var class="Ar">perimeter</var>.</dd>
  <dt id="job"><a class="permalink" href="#job"><code class="Fl">-job</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match <var class="Ar">job</var>.</dd>
  <dt id="tag"><a class="permalink" href="#tag"><code class="Fl">-tag</code></a>
    <var class="Ar">string</var></dt>
  <dd>Only apply command to snapshots that match <var class="Ar">tag</var>.</dd>
  <dt id="concurrency"><a class="permalink" href="#concurrency"><code class="Fl">-concurrency</code></a>
    <var class="Ar">number</var></dt>
  <dd>Set the maximum number of parallel tasks for faster processing. Defaults
      to <code class="Dv">8 * CPU count + 1</code>.</dd>
  <dt id="to"><a class="permalink" href="#to"><code class="Fl">-to</code></a>
    <var class="Ar">directory</var></dt>
  <dd>Specify the base directory to which the files will be restored. If
      omitted, files are restored to the current working directory.</dd>
  <dt id="rebase"><a class="permalink" href="#rebase"><code class="Fl">-rebase</code></a></dt>
  <dd>Strip the original path from each restored file, placing files directly in
      the specified directory (or the current working directory if
      <code class="Fl">-to</code> is omitted).</dd>
  <dt id="quiet"><a class="permalink" href="#quiet"><code class="Fl">-quiet</code></a></dt>
  <dd>Suppress output to standard input, only logging errors and warnings.</dd>
</dl>
</section>
<section class="Sh">
<h1 class="Sh" id="EXAMPLES"><a class="permalink" href="#EXAMPLES">EXAMPLES</a></h1>
<p class="Pp">Restore all files from a specific snapshot to the current
    directory:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar restore abc123</pre>
</div>
<p class="Pp">Restore to a specific directory:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar restore -to /mnt/ abc123</pre>
</div>
<p class="Pp">Restore with rebase option, placing files directly in the target
    directory:</p>
<div class="Bd Pp Bd-indent Li">
<pre>$ plakar restore -rebase -to /home/op abc123</pre>
</div>
</section>
<section class="Sh">
<h1 class="Sh" id="DIAGNOSTICS"><a class="permalink" href="#DIAGNOSTICS">DIAGNOSTICS</a></h1>
<p class="Pp">The <code class="Nm">plakar-restore</code> utility exits&#x00A0;0
    on success, and&#x00A0;&gt;0 if an error occurs.</p>
<dl class="Bl-tag">
  <dt>0</dt>
  <dd>Command completed successfully.</dd>
  <dt>&gt;0</dt>
  <dd>An error occurred, such as a failure to locate the snapshot or a
      destination directory issue.</dd>
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
