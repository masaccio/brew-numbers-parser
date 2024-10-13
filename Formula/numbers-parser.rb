class NumbersParser < Formula
  include Language::Python::Virtualenv

  desc "Read and write Apple Numbers spreadsheets"
  homepage "https://github.com/masaccio/numbers-parser"
  url "https://files.pythonhosted.org/packages/a0/ab/7f6daac0d3c20c917a10aa9a655ae2adacae5bd56a46505589050cc21a72/numbers_parser-4.14.1-py3-none-any.whl"
  sha256 "e48c0b1f43a1ff795e6c945b495313666e9d8ee8cf9a81f562130732997d7217"

  depends_on "protobuf"
  depends_on "python3"

  resource "compact-json" do
    url "https://files.pythonhosted.org/packages/62/3d/32da265b9d062ca624b60431b36ef97a2946e5252a79c08e4e14b0f9c3af/compact_json-1.8.1-py3-none-any.whl"
    sha256 "1232321c1eb65d48a341265cd289996c02fe4ce213ffc4cfe948c3faf985ea0a"
  end

  resource "enum-tools" do
    url "https://files.pythonhosted.org/packages/75/fc/cc600677fe58519352ae5fe9367d05d0054faa47e8c57ef50a1bb9c77b0e/enum_tools-0.12.0-py3-none-any.whl"
    sha256 "d69b019f193c7b850b17d9ce18440db7ed62381571409af80ccc08c5218b340a"
  end

  resource "importlib_resources" do
    url "https://files.pythonhosted.org/packages/e1/6a/4604f9ae2fa62ef47b9de2fa5ad599589d28c9fd1d335f32759813dfa91e/importlib_resources-6.4.5-py3-none-any.whl"
    sha256 "ac29d5f956f01d5e4bb63102a5a19957f1b9175e45649977264a1416783bb717"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/9b/55/f24e3b801d2e108c48aa2b1b59bb791b5cffba89465cbbf66fc98de89270/protobuf-5.28.2-py3-none-any.whl"
    sha256 "52235802093bd8a2811abbe8bf0ab9c5f54cca0a751fdd3f6ac2a21438bffece"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/ec/57/56b9bcc3c9c6a792fcbaf139543cee77261f3651ca9da0c93f5c1221264b/python_dateutil-2.9.0.post0-py2.py3-none-any.whl"
    sha256 "a8b2bc7bffae282281c8140a97d3aa9c14da0b136dfe83f850eea9a5f7470427"
  end

  resource "python-snappy" do
    url "https://files.pythonhosted.org/packages/86/c1/0ee413ddd639aebf22c85d6db39f136ccc10e6a4b4dd275a92b5c839de8d/python_snappy-0.7.3-py3-none-any.whl"
    sha256 "074c0636cfcd97e7251330f428064050ac81a52c62ed884fc2ddebbb60ed7f50"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/ff/ae/f19306b5a221f6a436d8f2238d5b80925004093fa3edea59835b514d9057/setuptools-75.1.0-py3-none-any.whl"
    sha256 "35ab7fd3bcd95e6b7fd704e4a1539513edad446c097797f2985e0e4b960772f2"
  end

  resource "sigfig" do
    url "https://files.pythonhosted.org/packages/f9/99/b109cbb4dd6af42f1706933810e6e54cd1786106508754af775856662304/sigfig-1.3.3-py3-none-any.whl"
    sha256 "7df6dfc45d09ee7e43a9418e944fcf06f8654477af263e3f0c2bee4234d6a84e"
  end

  resource "importlib_resources" do
    url "https://files.pythonhosted.org/packages/e1/6a/4604f9ae2fa62ef47b9de2fa5ad599589d28c9fd1d335f32759813dfa91e/importlib_resources-6.4.5-py3-none-any.whl"
    sha256 "ac29d5f956f01d5e4bb63102a5a19957f1b9175e45649977264a1416783bb717"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/ff/ae/f19306b5a221f6a436d8f2238d5b80925004093fa3edea59835b514d9057/setuptools-75.1.0-py3-none-any.whl"
    sha256 "35ab7fd3bcd95e6b7fd704e4a1539513edad446c097797f2985e0e4b960772f2"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/fd/84/fd2ba7aafacbad3c4201d395674fc6348826569da3c0937e75505ead3528/wcwidth-0.2.13-py2.py3-none-any.whl"
    sha256 "3da69048e4540d84af32131829ff948f1e022c1c6bdb8d6102117aac784f6859"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/f7/3f/01c8b82017c199075f8f788d0d906b9ffbbc5a47dc9918a945e13d5a2bda/pygments-2.18.0-py3-none-any.whl"
    sha256 "b8e6aca0523f3ab76fee51799c488e38782ac06eafcf95e7ba832985c8e7b13a"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/26/9f/ad63fc0248c5379346306f8668cda6e2e2e9c95e01216d2b8ffd9ff037d0/typing_extensions-4.12.2-py3-none-any.whl"
    sha256 "04e5ca0351e0f3f85c6853954072df659d0d13fac324d0072316b67d7794700d"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/d9/5a/e7c31adbe875f2abbb91bd84cf2dc52d792b5a01506781dbcf25c91daf11/six-1.16.0-py2.py3-none-any.whl"
    sha256 "8abb2f1d86890a2dfb989f9a77cfcfd3e47c2a354b01111771326f8aa26e0254"
  end

  resource "cramjam" do
    url "https://files.pythonhosted.org/packages/a7/fd/e309c1442973a22d87a494ec3107293be83a557f5595cc1ec33e2ec9c73a/cramjam-2.8.4-cp310-cp310-macosx_10_12_x86_64.whl"
    sha256 "e9e112514363261a896f85948d5d055dccaab2a1fa77d440f55030464118a95a"
  end

  resource "sortedcontainers" do
    url "https://files.pythonhosted.org/packages/32/46/9cb0e58b2deb7f82b84065f37f3bffeb12413f947f9388e4cac22c4621ce/sortedcontainers-2.4.0-py2.py3-none-any.whl"
    sha256 "a163dcaede0f1c021485e957a39245190e74249897e2ae4b2aa38595db237ee0"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_equal "4.14.1", shell_output("#{bin}/cat-numbers -V").strip
  end
end
