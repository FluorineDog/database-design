#!/bin/python3
from requests_html import HTML


def parse_movie(doc):
  html = HTML(html=doc)
  title = html.xpath("head/title")[0]
  title_str = title.text


  # director = html.find('#info > span:nth-child(1) > span.attrs > a')[0]
  director = html.find('#info > span  a[rel="v:directedBy"]')[0]
  director_str = director.text

  type = html.find('#info > span[property="v:genre"]')[0]
  type_str = type.text.split()[0]

  # release_date = html.find('#info > span[property="v:initialReleaseDate"]')[-1]
  # release_date_str = release_date.text

  length_in_minute =  html.find('#info > span[property="v:runtime"]')[0]
  length_in_minute_str = length_in_minute.attrs['content']

  comments_str = html.text
  is3D = comments_str.find("3D") != -1

  score = html.find('#interest_sectl strong[property="v:average"]')[0]
  score_str = score.text

  # divs = html.xpath("body/div")
  # print()
  print(director_str)
  print(type_str)
  # print(release_date_str)
  print(length_in_minute_str)
  print(is3D)
  print(score_str)

  actors = html.find('#info > span.actor > span.attrs')[0].find('a')
  actor_list = [actor.attrs['href'] for actor in actors]
  print(actor_list)

def main():
  with open("../html/movie.html") as file:
    parse_movie(file.read())

if __name__ == "__main__":
  main()