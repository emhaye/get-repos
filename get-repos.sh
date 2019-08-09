function get_repos() {
  curl --silent "https://api.github.com/orgs/gohugoid/repos" | grep '"full_name":' | sed -e 's/^.*": "//g' -e 's/",.*$//g' >> repos.txt
}
get_repos
cat repos.txt

function get_clone_urls() {
  curl --silent "https://api.github.com/orgs/gohugoid/repos" | grep '"clone_url":' | sed -e 's/^.*": "//g' -e 's/",.*$//g' >> clone_urls.txt
}
get_clone_urls
cat clone_urls.txt

while read repos; do
  curl --silent https://api.github.com/repos/$repos/commits | jq -r '.[0] | [.commit.author, .commit.url]'
done < repos.txt

rm repos.txt
rm clone_urls.txt