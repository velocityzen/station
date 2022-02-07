function sizes -d "Show directory tree sizes"
  ncdu --color dark -rr -x --exclude .git --exclude node_modules
end
