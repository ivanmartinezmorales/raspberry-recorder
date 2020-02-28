EXEC=run
FILE_NAME=setup-pi-ndvi.sh
CLEAN_OUT=clean
$(EXEC): $(FILE_NAME)
	chmod +x $(FILE_NAME)
	cp $(FILE_NAME) setup-ndvi
	./setup-ndvi

$(CLEAN_OUT): $(FILE_NAME)
	chmod -x $(FILE_NAME)
	rm setup-ndvi

