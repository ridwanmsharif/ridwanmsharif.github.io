serve: resume
	@echo "==> Starting Jekyll server..."
	@script/server

resume:
	@echo "==> Building resume..."
	@make -C resume
	@cp resume/resume.pdf ridwan-sharif-resume.pdf

.PHONY: serve resume