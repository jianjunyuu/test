#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e

# 用户输入的分支名
BRANCH_NAME=$1
# release分支
BRANCH_RELEASE=${BRANCH_NAME:=release}
# 开发环境分支
BRANCH_DEV=dev

#git checkout ${BRANCH_DEV}

# 需要检测一下是否需要进行一下操作：检测远程的head是否同步于本地head
if test -n "$(git diff ${BRANCH_DEV} origin/${BRANCH_DEV})"; then
    git pull origin ${BRANCH_DEV}
    git push origin ${BRANCH_DEV}
fi

# 直接创建release分支，如果有报错，则立即停止
git checkout -b ${BRANCH_RELEASE}
