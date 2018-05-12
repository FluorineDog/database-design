#!/bin/python3
from bs4 import BeautifulSoup

def walker(soup):
    if soup.name is not None:
        print(str(soup.name) + ":" + str(type(soup)))
        for child in soup.children:
            #process node
            walker(child)
string = '''
<div class="more-items">
</div>
'''
def main():
  with open("../html/top250.0.html") as file:
    raw_data = file.read()
    soup = BeautifulSoup(raw_data, "lxml")
    body = soup.body
    
    # print("\n********************************\n"
      # .join([repr(x) for x in body]))
    divs = body.find_all("div")

    wrapper = [
      x for x in divs if 
      x.name is not None 
      and x.attrs.get('id') == 'wrapper'
    ][0]
    movielist = [x for x in wrapper.div.ol.children if x.name ]
    for movie in movielist:
      addr = movie.find("a")
      print(movie)
      print("**********")

main()
