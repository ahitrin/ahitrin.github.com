.PHONY: all serve prod-serve

all: serve

serve:
	sudo docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=development -p 4000:4000 jekyll/jekyll jekyll serve --drafts

prod-serve:
	sudo docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=production -p 4000:4000 jekyll/jekyll jekyll serve
