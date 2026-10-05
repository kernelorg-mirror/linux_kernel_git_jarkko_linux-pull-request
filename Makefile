# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) Jarkko Sakkinen 2026

SHELL := bash
.SHELLFLAGS := -euo pipefail -c

XDG_DATA_HOME ?= $(HOME)/.local/share
BINDIR        ?= $(HOME)/.local/bin
DATADIR       ?= $(XDG_DATA_HOME)/linux-pr
TEMPLATES     := $(wildcard data/*.mbox.in)

.PHONY: default help install

default: help

help: ## Show this help
	@awk -F ':[^#]*## ?' '/^[a-z_-]+:[^#]*##/{printf "  make %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install linux-pr and its templates
	install -D -m 755 bin/linux-pr "$(DESTDIR)$(BINDIR)/linux-pr"
	install -d "$(DESTDIR)$(DATADIR)"
	install -m 644 $(TEMPLATES) "$(DESTDIR)$(DATADIR)"
