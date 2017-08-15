# iiif-vagrant

Vagrant box running the Loris IIIF server configured to serve
images from Fedora 4

## Prerequisites

1. Clone [iiif-env] into `/apps/git/iiif-env`.
2. Clone [pcdm-manifests] into `/apps/git/pcdm-manifests`.
3. Clone [mirador-static] into `/apps/git/mirador-static`.
4. To serve images from Fedora 4, clone and run the
   [fcrepo-vagrant]. The HTTP resolver in Loris is currently
   configured to serve images from
   <https://fcrepolocal/fcrepo/rest/{id}>.
   
## Setup

1. Clone this repository:

   ```
   git clone git@github.com:umd-lib/iiif-vagrant.git
   ```

2. Start the Vagrant:

   ```
   cd iiif-vagrant
   vagrant up
   ```

4. Add the server to your workstation's hosts file:

   ```
   192.168.40.13  iiiflocal
   ```

The server should now be up and running at <https://iiiflocal>

Loris should be running at <https://iiiflocal/images/>

[iiif-env]: https://bitbucket.org/umd-lib/iiif-env
[pcdm-manifests]: https://github.com/umd-lib/pcdm-manifests
[mirador-static]: https://github.com/umd-lib/mirador-static
[fcrepo-vagrant]: https://github.com/umd-lib/fcrepo-vagrant

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (Apache 2.0).

