temp_dir := temp
output := sunniesnow-sample.ssc

chart:
	mkdir -p $(temp_dir)
	for f in *.mscz; do mscore $$f -o $(temp_dir)/$${f%.mscz}.ogg; done
	for f in *.svg; do inkscape $$f --export-plain-svg --export-type=svg --export-filename=$(temp_dir)/$$f; done
	cp *.json $(temp_dir)
	make clean
	cd $(temp_dir); zip ../$(output) *; cd ..
	rm -r $(temp_dir)

clean:
	if [ -f $(output) ]; then rm $(output); fi
