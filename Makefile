.PHONY: all serve prod-serve update-gems

all: serve

serve:
	docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=development -p 4000:4000 jvconseil/jekyll-docker jekyll serve --drafts

prod-serve:
	docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=production -p 4000:4000 jvconseil/jekyll-docker jekyll serve

update-gems:
	docker run --rm -v "$(PWD)":/usr/src/app:rw -w /usr/src/app ruby:2.7 bundle update
