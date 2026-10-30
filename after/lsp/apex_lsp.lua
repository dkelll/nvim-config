-- apex_lsp: local Rust-based Apex language server
-- Binary: /Users/e191319/Projects/sf-lsp/target/debug/apex-lsp
-- Source: /Users/e191319/Projects/sf-lsp
--
-- To rebuild: cd /Users/e191319/Projects/sf-lsp && cargo build
-- For release: cargo build --release  (use target/release/apex-lsp in cmd below)

---@type vim.lsp.Config
return {
  cmd = { '/Users/e191319/Projects/sf-lsp/target/debug/apex-lsp' },
  filetypes = { 'apex', 'apexcode' },
  root_markers = { 'sfdx-project.json' },
}
