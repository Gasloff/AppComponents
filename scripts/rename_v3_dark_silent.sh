#!/usr/bin/env bash
# Silent renamer for icons_v3/Dark -> kebab-case *-icon[-N]-dark.svg based on icons_v2 naming
# - No prompts, no output
# - Safe if re-run; skips non-existent sources
# - Forces overwrite if target already exists (do not ask for confirmation)

set -u

root_dir="$(cd "$(dirname "$0")/.." && pwd)"
dark_dir="$root_dir/28/icons_v3/Dark"

# Helper: move if source exists, silently
mv_silent() {
  local src="$1"
  local dst="$2"
  if [ -f "$src" ]; then
    mv -f "$src" "$dst" >/dev/null 2>&1 || true
  fi
}

# AWS File Storage
mv_silent "$dark_dir/AWS File Storage.svg" "$dark_dir/aws-file-storage-icon-dark.svg"
mv_silent "$dark_dir/AWS File Storage 6.svg" "$dark_dir/aws-file-storage-icon-6-dark.svg"

# Application Settings
mv_silent "$dark_dir/Application Settings.svg" "$dark_dir/application-settings-icon-dark.svg"
mv_silent "$dark_dir/Application Settings 4.svg" "$dark_dir/application-settings-icon-4-dark.svg"

# Audit
mv_silent "$dark_dir/Audit.svg" "$dark_dir/audit-icon-dark.svg"

# BPM
mv_silent "$dark_dir/BPM.svg" "$dark_dir/bpm-icon-dark.svg"

# Business Calendars
mv_silent "$dark_dir/Business Calendars.svg" "$dark_dir/business-calendars-icon-dark.svg"

# Data Tools
mv_silent "$dark_dir/Data Tools.svg" "$dark_dir/data-tools-icon-dark.svg"

# Email -> email-sending
mv_silent "$dark_dir/Email.svg" "$dark_dir/email-sending-icon-dark.svg"
mv_silent "$dark_dir/Email 4.svg" "$dark_dir/email-sending-icon-4-dark.svg"

# LDAP
mv_silent "$dark_dir/LDAP.svg" "$dark_dir/ldap-icon-dark.svg"

# Multitenancy
mv_silent "$dark_dir/Multitenancy.svg" "$dark_dir/multitenancy-icon-dark.svg"
mv_silent "$dark_dir/Multitenancy 4.svg" "$dark_dir/multitenancy-icon-4-dark.svg"

# OpenID Connect
mv_silent "$dark_dir/OpenID Connect.svg" "$dark_dir/openid-connect-icon-dark.svg"

# Quartz
mv_silent "$dark_dir/Quartz.svg" "$dark_dir/quartz-icon-dark.svg"
mv_silent "$dark_dir/Quartz 4.svg" "$dark_dir/quartz-icon-4-dark.svg"

# REST API
mv_silent "$dark_dir/REST API.svg" "$dark_dir/rest-api-icon-dark.svg"
mv_silent "$dark_dir/REST API 4.svg" "$dark_dir/rest-api-icon-4-dark.svg"

# Reports (v3 has "Reports 2.svg"; map to the available v2 variant "reports-icon-4.svg")
mv_silent "$dark_dir/Reports.svg" "$dark_dir/reports-icon-dark.svg"
mv_silent "$dark_dir/Reports 2.svg" "$dark_dir/reports-icon-4-dark.svg"

# Translation (v3 has "Translation 4.svg"; map to v2 variant "translation-icon-2.svg")
mv_silent "$dark_dir/Translation.svg" "$dark_dir/translation-icon-dark.svg"
mv_silent "$dark_dir/Translation 4.svg" "$dark_dir/translation-icon-2-dark.svg"

# End silently
