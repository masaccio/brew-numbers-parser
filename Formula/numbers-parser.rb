class NumbersParser < Formula
  include Language::Python::Virtualenv

  desc "Read and write Apple Numbers spreadsheets"
  homepage "https://github.com/masaccio/numbers-parser"
  url "https://files.pythonhosted.org/packages/c0/d4/63364d716736dde4f9d8924645d21db481913a513f42458c290999822693/numbers_parser-4.14.1.tar.gz"
  sha256 "57f1a136c7ec036bd6b664fc9ce9a88268ed31911ba6944c0c600f4e68b37eae"

  depends_on "protobuf"
  depends_on "python3"

  def install
    venv = virtualenv_create(libexec, "python3)
    %w[['compact-json', 'protobuf', 'python-snappy', 'sigfig', 'setuptools', 'importlib-resources', 'enum-tools', 'python-dateutil']].each do |r|
      venv.pip_install resource(r)
    end
    venv.pip_install_and_link buildpath
  end

  test do
    assert_equal "4.14.1", shell_output("#{bin}/cat-numbers -V").strip
  end
end
