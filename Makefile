.PHONY: lint, test, help

help: 
	@echo Available commands:
	@for /F "tokens=1 delims=:" %%a in ('findstr /R "^[a-zA-Z_-]*:" Makefile') do @echo   %%a

lint:
	mypy . || rem
	black --line-length 80 . 
	flake8 . || rem
	pylint ./*/*.py

test:
	coverage run -m pytest . || rem
	@coverage report -m