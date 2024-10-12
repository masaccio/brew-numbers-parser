class NumbersParser < Formula
  include Language::Python::Virtualenv

  desc "Read and write Apple Numbers spreadsheets"
  homepage "https://github.com/masaccio/numbers-parser"
  url "https://files.pythonhosted.org/packages/f9/c0/399f1a507cd09c99aae6913d4e1298423319ef045cbbeb41f1c096798760/numbers_parser-4.13.3.tar.gz"
  sha256 "8a2af6344a230727f72e6758c562557ddbb124c07e1b49bb1fe3ba4d152f249c"

  depends_on "protobuf"
  depends_on "python3"

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_equal "4.13.3", shell_output("#{bin}/cat-numbers -V").strip
  end
end
