EXEC=run
FILE_NAME="setup-pi-ndvi.sh"
$(EXEC): $(FILE_NAME)
	chmod +x $(FILE_NAME)
	cp $(FILE_NAME) setup-ndvi
	./setup-ndvi
