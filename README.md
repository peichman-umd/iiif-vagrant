# iiif-vagrant

Vagrant box running the Loris IIIF server configured to serve
images from Fedora 4

## Prerequisites

1. Clone the `develop` branch of [iiif-env] into 
   `/apps/git/iiif-env`:
   
   ```
   cd /apps/git
   git clone -b develop git@bitbucket.org:umd-lib/iiif-env.git
   ```
   
2. To serve images from Fedora 4, clone and run the
   [fcrepo-vagrant]. The HTTP resolver in Loris is currently
   configured to serve images from
   <https://fcrepolocal/fcrepo/rest/{id}>
   
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

3. Start Apache:

   ```
   vagrant ssh
   cd /apps/iiif/apache
   ./control start
   ```

4. Add the server to your workstation's hosts file:

   ```
   192.168.40.13  iiiflocal
   ```

The server should now be up and running at <https://iiiflocal>

Loris should be running at <https://iiiflocal/images/>

[iiif-env]: https://bitbucket.org/umd-lib/iiif-env
[fcrepo-vagrant]: https://github.com/umd-lib/fcrepo-vagrant

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (Apache 2.0).

