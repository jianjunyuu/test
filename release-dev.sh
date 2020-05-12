#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e
set -x

# 用户输入的分支名
BRANCH_NAME=$1
# release分支
BRANCH_RELEASE=${BRANCH_NAME:=release}
# 开发环境分支
BRANCH_DEV=dev

./check-git-status.sh
git checkout ${BRANCH_DEV}

# 直接创建release分支，如果有报错，则立即停止
git checkout -b ${BRANCH_RELEASE}

# 部署AUT环境
./deplop-aut.sh
