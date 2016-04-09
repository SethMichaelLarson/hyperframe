.PHONY: certs publish test

certs:
	curl http://ci.kennethreitz.org/job/ca-bundle/lastSuccessfulBuild/artifact/cacerts.pem -o hyper/certs.pem

publish:
	rm -rf dist/
	python setup.py sdist bdist_wheel
	twine upload -s dist/*

test:
	py.test -n 4 --cov hyperframe test/
