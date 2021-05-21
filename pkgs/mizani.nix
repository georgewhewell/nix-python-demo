{
  buildPythonPackage
, fetchPypi
, numpy
, pandas
, matplotlib
, palettable
}:

buildPythonPackage rec {
  pname = "mizani";
  version = "0.7.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "193h6wkwdlsm83vvrxh0psyl2km01ysqmg19svy1iacws85k08gm";
  };

  propagatedBuildInputs = [ numpy pandas matplotlib palettable ];

  doCheck = false;
  doInstallCheck = false;

}
