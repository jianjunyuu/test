#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e

# 获取执行脚本的第一个参数，并生产release分支名
VERSION=$1
# 生产环境对应的分支
BRANCH_PRODUCTION=master
# 预上线环境对应的分支（该分支只会临时存在于整个release的过程，一旦结束release过程，就会删除该分支）
BRANCH_RELEASE=release
# 开发环境分支
BRANCH_DEV=dev

# 检查工作树的状态，如果不干净则提示并中断，需要人工操作之后可继续执行脚本
if test -n "$(git status --porcelain)"
then
  echo 'Unclean working tree. Commit or stash changes first.' >&2
  exit 128;
else
  echo 'Working tree clean.' >&2;
fi

# 确认是否继续后续到操作
read -p "Releasing $VERSION and publish to production environment(git-branch:$BRANCH_PRODUCTION) - are you sure? (y/n)" -n 1 -r

echo "Releasing $VERSION"

# 切换到生产分支
git checkout ${BRANCH_PRODUCTION}
echo "pull"
# 拉取远程最新提交代码
git pull origin ${BRANCH_PRODUCTION}
# 合并预上线分支到生产分支，保持生产环境代码的最新
git merge ${BRANCH_RELEASE}

# 打版本标签
git tag ${VERSION}

# 推送代码个标签到远程
git push origin ${BRANCH_PRODUCTION} --tags
# 删除release分支
git branch -d ${BRANCH_RELEASE}

echo "Release $VERSION successfully."

# 回归开发分支，避免停留在生产分支
git checkout ${BRANCH_DEV}


