# How to create a Package

You can take a look at some sample packages in
this [GitHub repository](https://github.com/useless-bit/Open-Package-Deploy-Packages).

<!-- TOC -->
* [How to create a Package](#how-to-create-a-package)
  * [Package structure](#package-structure)
  * [Create a Package](#create-a-package)
  * [Upload a Package](#upload-a-package)
  * [Update a Package](#update-a-package)
<!-- TOC -->

## Package structure

A package is a `.zip`-file that must contain either a `start.sh` (for Linux and macOS) or a `start.bat` (for Windows).

For Windows, it would look like this:

```
package.zip
|   start.bat
```

And for Linux and macOS:

```
package.zip
|   start.sh
```

If you need or want additional files for the deployment process (for example, installer files or other scripts), you can
just pack them into the zip file. The same goes for sub-folders.

## Create a Package

If you want to create a package, you can use the following script (tested on Linux) to create a zip file and calculate
the checksum.

The checksum must be `SHA3-512`.

```shell
#!/bin/bash

zip -r "$(basename "$PWD").zip" . -x "create_OPD-Package.sh" -x "$(basename "$PWD").zip"

checksum=$(openssl dgst -sha3-512 "$(basename "$PWD").zip")
checksum=$(echo "$checksum" | sed 's/.*)= //')

echo "Package: $(basename "$PWD")"
echo "Checksum: $checksum"
```

## Upload a Package

1. You can upload a new package on the `Packages`-Page after pressing `Add Package`.
2. You need to specify a name, the checksum of the zip file and the zip file itself.
3. After uploading the package, the server will automatically process it (validating the checksum, encrypting and
   testing the encryption).

## Update a Package

If you want to update a package, you can select a package on the `Packages`-Page and use the button `Update content` in
the `Options` section.

From there, you can follow Step 2 from [Upload a Package](#upload-a-package).