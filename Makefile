default: help

deploy:
	# 检查分支工作状态
	./build/check-git-status.sh
	# 将代码合并到release分支
	./build/release-dev.sh
	# 部署AUT环境
	./build/deploy-aut.sh

release:
	# 检查分支工作状态
	./build/check-git-status.sh
	# 将代码合并到master分支
	./build/release.sh
	# 部署正式环境
	./build/deploy.sh

help:
	@echo "   \033[35mmake\033[0m \033[1m命令使用说明\033[0m"
	@echo "   \033[35mmake deploy\033[0m\t\033[0m\t\033[0m\t\033[0m\t---  部署准生产环境"
	@echo "   \033[35mmake release <version> \033[0m\t\033[0m\t\033[0m\t\033[0m\t---  发布生产"
