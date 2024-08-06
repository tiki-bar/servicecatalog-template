### Parameters

#### Configure in Makefile
- NAME: Name of the deployment product
- BUCKET: Name of the s3 artifact bucket

#### Pass in Via CMD
- PRODUCT_ID: The product id from service catalog. You must first create the product.
- VERSION: The version of the product to publish.

Example:
```shell
make publish PRODUCT_ID=prod-123 VERSION=1.0.0
```

