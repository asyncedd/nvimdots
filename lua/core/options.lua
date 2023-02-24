local o = vim.opt

-- =======================================
-- 1. General options.
-- =======================================

-- 1.1. Undo related options
o.undofile = true -- Persistent undo's across all sessions

-- 1.2. Backup files
o.backup = false -- Don't write backups. (For better performance and, unneeded non-sense
o.writebackup = false -- Don't write backups.

-- 1.3 Clipboard related options.
o.clipboard = "unnamed,unnamedplus" -- Let's sync clipboards across platforms (Win###s, MacOS and, *Nix based systems)

-- =======================================
-- 2. Editing options.
-- =======================================

-- 2.1 Enable virtual edits
o.virtualedit = "onemore" -- Allow going one more character of the line.

-- 2.2 Some indent based options.
o.shiftwidth = 2 -- Insert two shifts per indent.
o.autoindent = true -- Copy indent from the current line when starting a new line
o.breakindent = true -- Indent wrapped lines too.
o.copyindent = true -- Copy the structure of the existing lines' indents.
o.expandtab = true -- Convert tabs to spaces.
o.smartindent = true -- Non-strict cindent.

-- 2.3 Wrap related options.
o.wrap = true -- Show long lines as multiple lines.

-- =======================================
-- 3. UI related options.
-- =======================================

-- 3.1 Enable line numbers.
o.number = true -- Enable line numbers
