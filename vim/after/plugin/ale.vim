let g:ale_linters_explicit = 1
let g:ale_linters = {
\  "cmake": ["cmakelint"],
\  "cpp": ["clangd", "clangtidy"],
\  "python": ["flake8", "pylint"],
\}
let g:ale_fixers = {
\  "cmake": ["trim_whitespace", "remove_trailing_lines", "cmakeformat"],
\  "cpp": ["clangtidy", "trim_whitespace", "remove_trailing_lines", "clang-format"],
\  "python": ["trim_whitespace", "remove_trailing_lines", "isort", "black"],
\}
