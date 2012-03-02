---
source:
- meta
authors:
- name: Trans
  email: transfire@gmail.com
copyrights:
- holder: Rubyworks
  year: '2011'
  license: BSD-2-Clause
requirements:
- name: rubytest
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
- uri: git://github.com/rubyworks/microtest.git
  scm: git
  name: upstream
resources:
  home: http://rubyworks.github.com/microtest
  code: http://github.com/rubyworks/microtest
extra: {}
load_path:
- lib
revision: 0
summary: Microminal TestUnit-style Test Framework
title: MicroTest
version: 0.2.0
name: microtest
description: ! 'MicroTest is very small Test::Unit/MiniTest compatbile

  test framework that run on top of the Ruby Universal

  Test Harness (Ruby Test).'
organization: Rubyworks
date: '2012-03-02'
