help:
	@echo "Commands:"
	@echo ""
	@echo "  install      install in editable mode"
	@echo "  dev-install  install in editable mode with dev requirements"
	@echo "  pytest       run the test suite and report coverage"
	@echo "  flake8       style check with flake8"
	@echo "  doc          build docs (update existing)"
	@echo "  doc-clean    build docs (new, removing any existing)"
	@echo "  linkcheck    check all links in docs"
	@echo "  clean        clean up all generated files"
	@echo ""

install:
	pip install -e .

dev-install:
	pip install -r requirements-dev.txt && pip install -e .

pytest:
	pytest --cov=empymod tests/ --flake8 --mpl && coverage html

flake8:
	flake8 docs/conf.py setup.py empymod/ tests/

doc:
	cd docs && make html && cd ..

doc-clean:
	cd docs && rm -rf api/ && rm -rf _build/ && make html && cd ..

linkcheck:
	cd docs && make html -b linkcheck && cd ..

clean:
	rm -rf empymod.egg-info/ empymod/version.py # build
	rm -rf */__pycache__/ */*/__pycache__/      # python cache
	rm -rf .coverage htmlcov/ .pytest_cache/    # tests and coverage
	rm -rf docs/examples/ docs/_build/          # docs
	rm -rf matplotlibrc
	rm -rf filters/ examples/educational/filters/
