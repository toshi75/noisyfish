function ecc
  type $argv[1] &>/dev/null
  if [ $status -eq 0 ]
    which $argv[1] |xsel -bi
    which $argv[1] |xsel -ip
  else
    echo "\"$argv[1]\" not found."
  end
  return 0
end

