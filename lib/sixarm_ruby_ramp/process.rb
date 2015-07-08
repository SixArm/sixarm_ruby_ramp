# -*- coding: utf-8 -*-
#
# = Process extensions to help debug Ruby programs.
#
# ==Examples
#
#   p = Process.ps
#   puts p
#   => the results of the 'ps' command for the current process id
#
#   p = Process.ps(1234)
#   puts p
#   => the results of the 'ps' command for process id 1234
#
#   p = Process.pss
#   p['%cpu'] => percentage of cpu use, as a float
#   p['%mem'] => percentage of memory use, as a float
##

module Process

  # Get the 'ps' command as one long text string.
  #
  # This is typically useful for logging to a text file.
  #
  # @example
  #   pid = 100
  #   Process.ps(pid)
  #   => "0.0 bfd86194 21:14:51 ..."
  #
  # @return [String] lots of data about the process
  #
  def self.ps(pid=Process.pid)
    `#{self.ps_command} #{pid.to_i}`
  end

  # Get the 'ps' command as a hash of keys and values.
  #
  # @return [Hash<String,String>] the ps command options as keys and values
  #
  # @example
  #   pid = 100
  #   Process.pss(pid)
  #   => {"cp"=>0.0, "esp"=>"bfd86194", "etime"=>"21:14:51", ...  }
  # -
  # OPTIMIZE: add dates, times
  #
  PS_TO_I = %w(c egid egroup uid fgid lwp ni nlwp pgid pid ppid rgid rss ruid sid sgid suid)
  PS_TO_F = %w(cp pcpu pmem)

  def self.pss(pid=Process.pid)
    ps=self.ps(pid)
    h=Hash[*self.ps_keys.zip(ps.split).flatten]
    PS_TO_I.each{|x| h[x]=h[x].to_i}
    PS_TO_F.each{|x| h[x]=h[x].to_f}
    self.ps_aliases.each_pair{|key,val| h[key]=h[val]}
    return h
  end

  # Get the list of process alias keywords as typically defined by the shell.
  #
  # For example, a shell may consider "%cpu" and "pcpu" to be identical.
  #
  # @example
  #   Process::PS_ALIASES_DEFAULT
  #   => {"%cpu"=>"pcpu", "sigmask"=>"blocked", "class"=>"cls", ... }
  #
  # @return [Hash<String,String>] process keyword aliases
  #
  PS_ALIASES_DEFAULT={
    '%cpu'=>'pcpu',
    '%mem'=>'pmem',
    'sig_block'=>'blocked',
    'sigmask'=>'blocked',
    'sig_catch'=>'caught',
    'sigcatch'=>'caught',
    'class'=>'cls',
    'policy'=>'pol',
    'cputime'=>'time',
    'gid'=>'egid',
    'group'=>'egroup',
    'uid'=>'euid',
    'uname'=>'euser',
    'user'=>'euser',
    'flag'=>'f',
    'flags'=>'f',
    'fsuid'=>'fuid',
    'sig_ignore'=>'ignored',
    'sigignore'=>'ignored',
    'spid'=>'lwp',
    'tid'=>'lwp',
    'nice'=>'ni',
    'thcount'=>'nlwp',
    'sig'=>'pending',
    'sig_pend'=>'pending',
    'pgrp'=>'pgid',
    'rssize'=>'rss',
    'rsz'=>'rss',
    'state'=>'s',
    'sess'=>'sid',
    'session'=>'sid',
    'svgid'=>'sgid',
    'tt'=>'tname',
    'tty'=>'tname',
    'vsz'=>'vsize'
  }

  # Get the list of process alias keywords as typically defined by the shell.
  #
  # For example, a shell may consider "%cpu" and "pcpu" to be identical.
  #
  # @example
  #   Process.ps_aliases
  #   => {"%cpu"=>"pcpu", "sigmask"=>"blocked", "class"=>"cls", ... }
  #
  # @return [Hash<String,String>] process keyword aliases
  #
  def self.ps_aliases
    @@ps_aliases||=PS_ALIASES_DEFAULT
  end

  # Set the list of process alias keywords.
  #
  # For example, a shell may consider "%cpu" and "pcpu" to be identical.
  #
  # @example
  #   Process::ps_aliases={ {"%cpu"=>"pcpu", "sigmask"=>"blocked", "class"=>"cls" }
  #   => {"%cpu"=>"pcpu", "sigmask"=>"blocked", "class"=>"cls"}
  #
  # @param [Hash<String,String>] aliases
  # @return [Hash<String,String>] aliases
  #
  def self.ps_aliases=(aliases)
    @@ps_aliases=aliases
  end

  # The list of process keywords.
  #
  # Omit:
  #
  #  * pstime, putime, wq, wqb: not available on travis-ci.org
  #
  PS_KEYS_DEFAULT=%w'%cpu %mem acflag acflg args blocked comm command cpu cputime etime f flags gid group inblk inblock jobc ktrace ktracep lim login logname lstart majflt minflt msgrcv msgsnd ni nice nivcsw nsignals nsigs nswap nvcsw nwchan oublk oublock p_ru paddr pagein pcpu pending pgid pid pmem ppid pri rgid rgroup rss ruid ruser sess sig sigmask sl start stat state stime svgid svuid tdev time tpgid tsess tsiz tt tty ucomm uid upr user usrpri utime vsize vsz wchan wql wqr xstat'

  # Get the list of process keywords.
  #
  # @example
  #   Process.ps_keys
  #   => ["blocked","group","pending","size"]
  #
  # @return [Array<String>] the list of process keywords.
  #
  def self.ps_keys
    @@ps_keys||=PS_KEYS_DEFAULT
  end

  # Set the list of process keywords.
  #
  # @example
  #   Process.ps_keys = ["blocked","group","pending","size"]
  #
  # @param [Array<String>] keywords
  # @return [Array<String>] keywords
  #
  def self.ps_keys=(keys)
    @@ps_keys=keys
  end

  # The process command, i.e. what the sytem will call for the "ps" command.
  #
  # The goal is to use command that works on all platforms,
  # that gets data without headers and with the widest output.
  #
  # Linux can use e.g.:
  #
  #     ps hww -o pid,%cpu
  #
  # Note the "h" is less portable; we prefer "--no-headers".
  #
  # Note the "ww" is less portable; we prefer "-w -w".
  #
  # OSX doesn't have "h" or "--no-headers". Instead, OSX uses a format
  # string to set each column header to blank, e.g. `ps -o 'pid=,%cpu='`.
  #
  # A workaroud is to delete the header row by using `sed 1d`;
  # we prefer a pure `ps` solution so we don't depend on `sed`.
  #
  # The solution we use seems to work in practice:
  # we use multiple `-o` output fields, and set each
  # output field to use a blank string as a header.
  # This makes the `ps` command skip the header row.
  #
  # Example that succeeds on all our known systems:
  #
  #     ps -o pid='' -o %cpu='' -o %mem=''
  #
  PS_COMMAND_DEFAULT="ps " + ps_keys.map{|k| "-o #{k}=''"}.join(" ")

  # Get the process command, i.e. what the sytem will call for the "ps" command.
  #
  # @example
  #   Process.ps_command
  #   => "ps -o blocked='' -o group='' -o pending='' -o size=''"
  #
  # @return [String] the process command
  #
  def self.ps_command
    @@ps_command||=PS_COMMAND_DEFAULT
  end

  # Set the process command, i.e. what the sytem will call for the "ps" command.
  #
  # @example
  #   Process.ps_command = "ps h ww -o blocked,group,pending,size"
  #
  # @param [String] the process command
  # @return [String] the process command
  #
  def self.ps_command=(command)
    @@ps_command=command
  end

end
