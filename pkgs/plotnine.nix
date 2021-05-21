{
  buildPythonPackage
, fetchPypi
, mizani
, matplotlib
, numpy
, scipy
, patsy
, statsmodels
, pandas
, descartes
}:

buildPythonPackage rec {
  pname = "plotnine";
  version = "0.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0xljjvdicrl41fzghy1sgzm14qhz1dyn8f2jnrhnf418rknmkpir";
  };

  postPatch = ''
    # make less fussy about version
    substituteInPlace setup.py \
      --replace "statsmodels >= 0.12.1" "statsmodels"
  '';

  propagatedBuildInputs = [
    mizani
    matplotlib
    numpy
    scipy
    patsy
    statsmodels
    pandas

    # tests fail :(
    (descartes.overrideAttrs(o: { doInstallCheck = false; }))
  ];

  doCheck = false;
  doInstallCheck = false;

}
