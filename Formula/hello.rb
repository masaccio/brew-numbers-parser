class Hello < Formula
  desc "A simple 'hello world' program"
  homepage "https://github.com/<your-username>/hello-world-cli"
  url "..."
  sha256 "..."
  license "MIT"

  def install
    bin.install "dist/hello-macos"
  end

  test do
    assert_equal "Hello World!", shell_output("#{bin}/hello-macos").strip
    assert_equal "Hello John!", shell_output("#{bin}/hello-macos John").strip
  end
end
