LINK_DATA=https://www.dropbox.com/s/ssagp9xkpvxuhgw/datajet.h5?dl=0
VIRTUAL_ENV=venv

$(VIRTUAL_ENV):
	python3 -m venv $@
	$@/bin/pip install -r requirements.txt
	$@/bin/pip install jupyter

datajet.h5:
	wget $(LINK_DATA) -O $@

install: $(VIRTUAL_ENV) datajet.h5
	$(VIRTUAL_ENV)/bin/jupyter notebook hotwire.ipynb

solution:
	git checkout $(shell git remote)/solution hotwire-solution.ipynb data_structure_functions.npz

clean:
	rm -rf $(VIRTUAL_ENV) datajet.h5
