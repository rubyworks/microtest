---
source:
- PROFILE
- VERSION
authors:
- name: Thomas Sawyer
  email: transfire@gmail.com
copyrights:
- holder: Thomas Sawyer
  year: '2011'
  license: BSD-2-Clause
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
alternatives: []
conflicts: []
repositories:
- uri: git://github.com/proutils/microtest.git
  scm: git
  name: upstream
resources:
  home: http://rubyworks.github.com/microtest
  code: http://github.com/rubyworks/microtest
extra: {}
load_path:
- lib
revision: 0
name: microtest
title: MicroTest
summary: Microminal TestUnit-style Test Framework
description: MicroTest is very small Test::Unit/MiniTest compatbile test framework
  that run on top of the Ruby Universal Test Harness (Ruby Test).
organization: RubyWorks
version: 0.1.1
date: '2012-02-29'
