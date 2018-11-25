LINK_DATA=https://www.dropbox.com/s/mpqinbudtp64iki/DataJet.tar.gz
VIRTUAL_ENV=venv

$(VIRTUAL_ENV):
	python3 -m venv $@
	$@/bin/pip install -r requirements.txt

DataJet:
	wget $(LINK_DATA) -O - | tar xz

install: $(VIRTUAL_ENV) DataJet
	$(VIRTUAL_ENV)/bin/jupyter notebook hotwire.ipynb

clean:
	rm -rf $(VIRTUAL_ENV) DataJet
