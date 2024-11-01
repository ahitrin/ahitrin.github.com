.PHONY: all serve prod-serve update-gems

IMAGE=jekyll/jekyll
ifeq ($(shell uname -m),arm64)
	EXTRA_OPTS := --platform linux/amd64
else
	EXTRA_OPTS :=
endif

all: serve

serve:
	docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=development -p 4000:4000 $(EXTRA_OPTS) $(IMAGE) jekyll serve --drafts

prod-serve:
	docker run --rm --volume="$(PWD):/srv/jekyll" -it --env JEKYLL_ENV=production -p 4000:4000 $(EXTRA_OPTS) $(IMAGE) jekyll serve

update-gems:
	docker run --rm -v "$(PWD)":/usr/src/app:rw -w /usr/src/app $(EXTRA_OPTS) ruby:2.7 bundle update
