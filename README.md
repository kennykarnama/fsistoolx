## fsistoolx

Utility tool for Financial Integrated Service

## Bundle 

Produce bundle by 

```
docker buildx build \
	-f Dockerfile \
	--target deps-bundle \
	--output type=tar,dest=deps-bundle-stage.tar \
	.

tar -xf deps-bundle-stage.tar deps-bundle.tar.gz
```