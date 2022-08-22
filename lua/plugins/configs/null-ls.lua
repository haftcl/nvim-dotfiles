local status_ok, nullls = pcall(require, "null-ls")

if not status_ok then
  return
end

nullls.setup{
  sources = {
    nullls.builtins.formatting.prettierd,
    nullls.builtins.diagnostics.eslint_d,
    nullls.builtins.diagnostics.phpcs.with({
      command = "phpcs.phar",
      extra_args = { "--standard=PSR12" },
    }),
    nullls.builtins.formatting.phpcbf.with({
      command = "phpcbf.phar",
      extra_args = { "--standard=PSR12" },
    }),
  }
}
