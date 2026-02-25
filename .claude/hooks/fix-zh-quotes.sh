#!/bin/bash

# PostToolUse hook: auto-fix Chinese quotes in src/zh/ files
# 1. Replace ASCII straight quotes " with curly quotes ""
# 2. Fix mismatched curly quote pairs (e.g. "" → "")
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Process Chinese markdown files only (NOT SVG — curly quotes break XML attributes)
if [[ "$FILE_PATH" =~ src/zh/.*\.md$ ]]; then
  MODE="md"
else
  exit 0
fi

python3 -c "
import re, sys

filepath = '$FILE_PATH'
L = '”'
R = '”'

with open(filepath, 'r') as f:
    content = f.read()

# --- Step 1: Replace ASCII straight quotes with curly quotes ---

lines = content.split('\n')
fixed = []
for line in lines:
    if line.strip().startswith('<!--'):
        fixed.append(line)
        continue
    # Protect HTML attribute quotes: find all attr=”value” spans
    # and mark their positions as protected
    protected = set()
    for m in re.finditer(r'[a-zA-Z-]=\”[^\”]*\”', line):
        for pos in range(m.start(), m.end()):
            protected.add(pos)
    result, q = [], False
    for i, ch in enumerate(line):
        if ch == '\”' and i not in protected:
            result.append(L if not q else R)
            q = not q
        else:
            result.append(ch)
    fixed.append(''.join(result))
new_content = '\n'.join(fixed)

# --- Step 2: Fix mismatched curly quote pairs ---
# Ensure alternation: 1st=left, 2nd=right, 3rd=left, etc. per line

lines2 = new_content.split('\n')
fixed2 = []
for line in lines2:
    result = []
    qi = 0
    for ch in line:
        if ch in (L, R):
            result.append(L if qi % 2 == 0 else R)
            qi += 1
        else:
            result.append(ch)
    fixed2.append(''.join(result))
new_content = '\n'.join(fixed2)

if new_content != content:
    with open(filepath, 'w') as f:
        f.write(new_content)
    diff = sum(1 for a, b in zip(content, new_content) if a != b)
    print(f'Fixed {diff} quote issues in {filepath}', file=sys.stderr)
"

exit 0
