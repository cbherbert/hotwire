LINK_DATA=https://www.dropbox.com/s/ssagp9xkpvxuhgw/datajet.h5?dl=0
VIRTUAL_ENV=venv

$(VIRTUAL_ENV):
	#python3 -m venv $@ # This is a separate package on Ubuntu/Debian, use virtualenv instead
	virtualenv -p $(shell which python3) $@
	$@/bin/pip install -r requirements.txt
	$@/bin/pip install jupyter

datajet.h5:
	wget $(LINK_DATA) -O $@

install: $(VIRTUAL_ENV) datajet.h5
	$(VIRTUAL_ENV)/bin/jupyter notebook hotwire.ipynb

clean:
	rm -rf $(VIRTUAL_ENV) datajet.h5
