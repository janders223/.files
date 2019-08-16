{
  la = "ls -halF";
  rebuild = "darwin-rebuild switch";
  git = "hub";
  path = "echo $PATH | tr -s ':' '\n'";
}

