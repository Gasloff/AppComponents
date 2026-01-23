#!/usr/bin/env bash
# Silent renamer for icons_v3/Light -> kebab-case *-icon[ -N].svg based on icons_v2 naming
# - No prompts, no output
# - Safe if re-run; skips non-existent sources
# - Forces overwrite if target already exists (matches requirement: do not ask for confirmation)

set -u

root_dir="$(cd "$(dirname "$0")/.." && pwd)"
light_dir="$root_dir/28/icons_v3/Light"

# Helper: move if source exists, silently
mv_silent() {
  local src="$1"
  local dst="$2"
  if [ -f "$src" ]; then
    mv -f "$src" "$dst" >/dev/null 2>&1 || true
  fi
}

# AWS File Storage (already renamed in prior step, keep for idempotency)
mv_silent "$light_dir/AWS File Storage.svg" "$light_dir/aws-file-storage-icon.svg"
mv_silent "$light_dir/AWS File Storage 6.svg" "$light_dir/aws-file-storage-icon-6.svg"

# Application Settings
mv_silent "$light_dir/Application Settings.svg" "$light_dir/application-settings-icon.svg"
mv_silent "$light_dir/Application Settings 4.svg" "$light_dir/application-settings-icon-4.svg"

# Audit
mv_silent "$light_dir/Audit.svg" "$light_dir/audit-icon.svg"

# BPM
mv_silent "$light_dir/BPM.svg" "$light_dir/bpm-icon.svg"

# Business Calendars
mv_silent "$light_dir/Business Calendars.svg" "$light_dir/business-calendars-icon.svg"

# Data Tools
mv_silent "$light_dir/Data Tools.svg" "$light_dir/data-tools-icon.svg"

# Email -> email-sending
mv_silent "$light_dir/Email.svg" "$light_dir/email-sending-icon.svg"
mv_silent "$light_dir/Email 4.svg" "$light_dir/email-sending-icon-4.svg"

# LDAP
mv_silent "$light_dir/LDAP.svg" "$light_dir/ldap-icon.svg"

# Multitenancy
mv_silent "$light_dir/Multitenancy.svg" "$light_dir/multitenancy-icon.svg"
mv_silent "$light_dir/Multitenancy 4.svg" "$light_dir/multitenancy-icon-4.svg"

# OpenID Connect
mv_silent "$light_dir/OpenID Connect.svg" "$light_dir/openid-connect-icon.svg"

# Quartz
mv_silent "$light_dir/Quartz.svg" "$light_dir/quartz-icon.svg"
mv_silent "$light_dir/Quartz 4.svg" "$light_dir/quartz-icon-4.svg"

# REST API
mv_silent "$light_dir/REST API.svg" "$light_dir/rest-api-icon.svg"
mv_silent "$light_dir/REST API 4.svg" "$light_dir/rest-api-icon-4.svg"

# Reports (v3 has "Reports 2.svg"; map to the available v2 variant "reports-icon-4.svg")
mv_silent "$light_dir/Reports.svg" "$light_dir/reports-icon.svg"
mv_silent "$light_dir/Reports 2.svg" "$light_dir/reports-icon-4.svg"

# Translation (v3 has "Translation 4.svg"; map to v2 variant "translation-icon-2.svg")
mv_silent "$light_dir/Translation.svg" "$light_dir/translation-icon.svg"
mv_silent "$light_dir/Translation 4.svg" "$light_dir/translation-icon-2.svg"

# End silently