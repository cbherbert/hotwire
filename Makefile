LINK_DATA=https://www.dropbox.com/s/mpqinbudtp64iki/DataJet.tar.gz
VIRTUAL_ENV=venv

$(VIRTUAL_ENV):
	#python3 -m venv $@ # This is a separate package on Ubuntu/Debian, use virtualenv instead
	virtualenv -p $(shell which python3) $@
	$@/bin/pip install -r requirements.txt

DataJet:
	wget $(LINK_DATA) -O - | tar xz

install: $(VIRTUAL_ENV) DataJet
	$(VIRTUAL_ENV)/bin/jupyter notebook hotwire.ipynb

solution:
	git checkout $(shell git remote)/solution hotwire-solution.ipynb data_structure_functions.npz

clean:
	rm -rf $(VIRTUAL_ENV) DataJet
