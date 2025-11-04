serve: resume
	@echo "==> Starting Jekyll server..."
	@bundle exec jekyll serve

resume:
	@echo "==> Building resume..."
	@make -C resume
	@cp resume/resume.pdf ridwan-sharif-resume.pdf

.PHONY: serve resume