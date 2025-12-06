#hyper-v scripts by Lee & Copilot

A legendary collection of PowerShell scripts to tame Hyper-V’s IP Address shuffle and restore adapter sanity. Built from real-world battle scars, whiteboard wisdom, and the joy of semantic infrastructure.

## 🧠 What This Is

This repo contains scripts that:
- Pin static IPv6 addresses to MACs across Hyper-V adapters
- Restore adapter identity after reboots or interface drift
- Rebind virtual switches to trusted interfaces
- Integrate with semantic trust ledgers for teachable recovery

## 🧰 Scripts Included

- `assign_static_ipv6.ps1`: Assigns MAC-derived and canonical IPv6 addresses
- `restore_adapter_identity.ps1`: Renames adapters based on MAC mapping
- `bind_switches_to_roles.ps1`: Ensures Hyper-V switches bind to correct adapters

## 🧾 Who This Is For

- IT students 
- Home lab builders running Active Directory in Hyper-V
- Anyone tired of rebooting and losing their network config
- Contributors who value semantic, teachable infrastructure

## 🧠 Lee’s Hyper-V War Story

> “I remember taking a class on Hyper-V switches. Every time I rebooted, my adapter labels changed and my notes became useless. I even bought a whiteboard to keep track. This repo is the fix I wish I had back then.”

## 🧠 Semantic Trust Integration

Each script is tagged with semantic events for recovery logging. You can optionally log milestones like:

```bash
2025-11-02T01:15:00 | semantic-event:ipv6-static-mapping | MAC-pinned IPv6 assigned to Hyper-V adapters | Lee + Copilot
