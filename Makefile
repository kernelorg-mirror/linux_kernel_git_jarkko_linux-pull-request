# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) Jarkko Sakkinen 2026

SHELL := bash
.SHELLFLAGS := -euo pipefail -c

XDG_DATA_HOME ?= $(HOME)/.local/share
BINDIR        ?= $(HOME)/.local/bin
DATADIR       ?= $(XDG_DATA_HOME)/linux-pr
TEMPLATES     := $(wildcard data/*.mbox.in)

export BINDIR DATADIR DESTDIR

.PHONY: default help install

default: help

help: ## Show this help
	@awk -F ':[^#]*## ?' '/^[a-z_-]+:[^#]*##/{printf "  make %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install linux-pr and its templates
	@script=$$(mktemp); \
	trap 'rm -f "$$script"' EXIT; \
	TEMPLATE_DIR="$$(printf '%q' "$$DATADIR")" \
		awk '/^TEMPLATE_DIR=/ {$$0 = "TEMPLATE_DIR=" ENVIRON["TEMPLATE_DIR"]} {print}' \
		bin/linux-pr > "$$script"; \
	install -D -m 755 "$$script" "$${DESTDIR:-}$$BINDIR/linux-pr"
	install -d "$${DESTDIR:-}$$DATADIR"
	install -m 644 $(TEMPLATES) "$${DESTDIR:-}$$DATADIR"
