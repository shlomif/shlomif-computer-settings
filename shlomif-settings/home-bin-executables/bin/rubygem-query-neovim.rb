#!/usr/bin/env ruby
#
# rubygem-query-neovim.rb
# Copyright (C) 2021 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#

text = `gem list neovim`

if not $?
  puts "please run 'gem install neovim --pre' to install the prerelease"
  raise "foo"
end

if not text.match(/neovim \(([0-9]+)\.([0-9]+)/) {
    |m| ver1 = m.captures[0].to_i
    ver2 = m.captures[1].to_i
    if not (ver1 > 0 or (ver1 == 0 and ver2 >= 9))
      puts "neovim gem's version too low"
      puts "please run 'gem install neovim --pre' to install the prerelease"
      raise "foo"
    end
    return true
}
  raise "cannot match"
end

<<'EOF'
require 'rubygems/query_utils'

class Main
  include Gem::QueryUtils

  def options
    return {:args => ["list", ], :version => "0.8.1", }
  end
  def main
    check_installed_gems(['neovim'])
    return
  end
end

Main.new.main()
EOF
