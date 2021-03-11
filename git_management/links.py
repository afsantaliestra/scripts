import requests
from requests.auth import HTTPBasicAuth

username = 'user@user.user'
password = 'password'
team = 'team'

next_page_url = 'https://api.bitbucket.org/2.0/repositories/%s?pagelen=10&fields=next,values.links.clone.href,values.slug' % team
full_repo_list = []
f = open("list.txt", "a")
while next_page_url is not None:
    response = requests.get(next_page_url,
                            auth=HTTPBasicAuth(username, password))
    page_json = response.json()
    for repo in page_json['values']:
        reponame = repo['slug']
        repohttp = repo['links']['clone'][0]['href'].replace(
            'SaravThangaraj@', '')
        repogit = repo['links']['clone'][1]['href']

        print(reponame + "," + repohttp + "," + repogit)
        full_repo_list.append(repogit)

        f.write(f'{repogit}\n')

    next_page_url = page_json.get('next', None)

f.close()
print("Result:", len(full_repo_list))
