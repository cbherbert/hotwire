LINK_DATA=https://www.dropbox.com/s/mpqinbudtp64iki/DataJet.tar.gz

DataJet:
	wget $(LINK_DATA) -O - | tar xz

install: DataJet
	jupyter-3.7 notebook hotwire.ipynb

clean:
	rm -rf DataJet
