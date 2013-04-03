ghanity ()
{
  about 'create GitHub vanity URL'
  param '1: vanity shortcode'
  param '2: URL'
  example '$ ghanity composure https://github.com/erichs/composure'
  group 'git'

  local code="$1" url="$2";
  echo 'creating vanity GitHub URL... '
  ghurl=$(curl -s -i http://git.io -F "url=$url" -F "code=$code" \
        | grep Location \
        | awk '{print $2}')
  echo $ghurl | pbcopy
  echo "copied to clipboard: ${ghurl}"
}
