.PHONY: build clean serve

build:
	./build.sh

serve: build
	open http://localhost:8000 &
	cd public && python3 -m http.server

clean:
	rm -rf public/
