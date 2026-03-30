#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Roopsha Ghosh| Reg No: 24BCE10292
# Course: Open Source Software | OSS NGMC Capstone Project
# Description: Interactively asks the user three questions
#              and composes a personalised open-source
#              philosophy statement, saved to a .txt file.
# ============================================================

# ALIAS CONCEPT (demonstrated via comment and function)
# In a real shell session, 'alias' creates shorthand commands.
# Example: alias gs='git status'
# Here we define a helper function — the function-as-alias pattern.
# ============================================================
print_divider() {
    echo "================================================================"
}

print_section() {
    echo ""
    echo "  --- $1 ---"
    echo ""
}

# ============================================================
# Welcome screen
# ============================================================
clear
USERNAME=$(whoami)
echo "  Welcome, $USERNAME 👋"

print_divider
echo "       The Open Source Manifesto Generator                        "
print_divider
echo ""
echo "  This script will generate a personalised open-source"
echo "  philosophy statement based on your answers."
echo "  Your manifesto will be saved as a .txt file."
echo ""
print_divider
echo ""

# ============================================================
# Interactive user input using 'read'
# The -p flag shows a prompt inline
# ============================================================
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""
read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# ============================================================
# Validate inputs — ensure user actually entered something
# ============================================================
if [[ -z "${TOOL// }" || -z "${FREEDOM// }" || -z "${BUILD// }" ]]; then
    echo "  ERROR: Please answer all three questions."
    echo "  Run the script again and fill in each response."
    exit 1
fi

# ============================================================
# Date and output file setup
# ============================================================
DATE=$(date '+%d %B %Y')                     # e.g. 25 March 2026
TIME=$(date '+%H:%M')                        # e.g. 15:30
USERNAME=$(whoami)                           # Current Linux user
OUTPUT="oss_manifesto_${USERNAME}_$(date +%s).txt"         # Output filename

# ============================================================
# String concatenation: Build the manifesto paragraph
# Using echo with >> to append each line to the file
# > overwrites; >> appends
# ============================================================

# Start fresh — overwrite if file already exists
echo "OPEN SOURCE MANIFESTO" > "$OUTPUT"
echo "Generated on $DATE at $TIME by $USERNAME" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose the manifesto using the three user inputs ---
# Each echo >> adds a line to the file
echo "I am a student of open source — not just of its code, but of its" >> "$OUTPUT"
echo "values. Every day, I rely on $TOOL, a tool built by people I have" >> "$OUTPUT"
echo "never met, who chose to share their work with the world. They asked" >> "$OUTPUT"
echo "nothing in return except that I do the same." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom means $FREEDOM. That is why open source matters: it" >> "$OUTPUT"
echo "is not merely a licensing model but a commitment to the idea that" >> "$OUTPUT"
echo "knowledge grows stronger when it is shared. Every fork, every pull" >> "$OUTPUT"
echo "request, every issue filed is an act of trust between strangers." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "One day, I intend to build $BUILD and release it freely under an" >> "$OUTPUT"
echo "open license. I will do this because I understand what it means to" >> "$OUTPUT"
echo "stand on the shoulders of those who came before me. The developers" >> "$OUTPUT"
echo "who built $TOOL did not hoard their work. Neither will I." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "This is my commitment to the open-source way." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "                                    — $USERNAME, $DATE" >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"

# ============================================================
# Display results
# ============================================================
print_divider
echo "  Manifesto saved to: $OUTPUT"
print_divider
echo ""

read -p "  Do you want to preview your manifesto? (y/n): " CHOICE

if [[ "$CHOICE" == "y" || "$CHOICE" == "Y" ]]; then
    cat "$OUTPUT"
fi
# cat prints the saved file to screen for confirmation
cat "$OUTPUT"

echo ""
print_divider
echo "  Your manifesto is ready 🚀"
echo "  Tip: Upload it to GitHub as your first open-source identity!"
print_divider

echo "---------------------------------------------------------------"
echo "  Generated by: Roopsha Ghosh"
echo "  OSS Capstone Project"
echo "==============================================================="