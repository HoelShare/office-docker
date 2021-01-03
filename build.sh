tag=$1

if [ -z "$tag" ]
then
  git submodule update --init --remote --checkout
  git add core/src
  git add ui/src
  git commit -m "Create version latest"
  tag="latest"
else
  cd core/src
  git fetch
  git checkout $tag
  if [ $? -ne 0 ]
  then
    echo "Version does not exist in core/src" >&2
    exit 1
  fi
  cd ../..
  cd ui/src
  git fetch
  git checkout $tag
  if [ $? -ne 0 ]
  then
    echo "Version does not exist in ui/src" >&2
    exit 1
  fi
  cd ../..

  git add core/src
  git add ui/src
  git commit -m "Create version $tag"
  git tag $tag
  git push --tags
fi

echo "Create Version $tag"
git submodule update --init --remote --checkout

docker build -t hoelshare/office-core:$tag core
docker push hoelshare/office-core:$tag

docker build -t hoelshare/office-ui:$tag ui
docker push hoelshare/office-ui:$tag
