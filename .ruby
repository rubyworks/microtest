---
authors:
- name: Thomas Sawyer
  email: transfire@gmail.com
copyrights:
- holder: Thomas Sawyer
  year: '2011'
  license: BSD-2-Clause
replacements: []
conflicts: []
requirements:
- name: test
- name: detroit
  groups:
  - build
  development: true
- name: reap
  groups:
  - build
  development: true
- name: qed
  groups:
  - test
  development: true
dependencies: []
repositories:
- uri: git://github.com/proutils/microtest.git
  scm: git
  name: upstream
resources:
  home: http://rubyworks.github.com/microtest
  code: http://github.com/rubyworks/microtest
load_path:
- lib
extra:
  manifest: MANIFEST
alternatives: []
revision: 0
name: microtest
title: MicroTest
summary: Microminal TestUnit-style Test Framework
description: MicroTest is very small Test::Unit/MiniTest compatbile test framework
  that run on top of the Ruby Universal Test Harness (Ruby Test).
organization: RubyWorks
version: ''
date: '2011-08-11'
