class Doistbot < Formula
  desc "Local self-review CLI for code changes"
  homepage "https://github.com/Doist/doistbot-app"
  url "https://registry.npmjs.org/@doist/doistbot-cli/-/doistbot-cli-1.0.0.tgz"
  sha256 "f82796d05f076ba091b63ac463545fdb2848c6b4890a69319f9664b8e1501941"
  license "UNLICENSED"

  depends_on "node@24"

  def install
    system Formula["node@24"].opt_bin/"npm", "install", "-g", "--prefix", libexec, cached_download
    bin.install_symlink libexec/"bin/doistbot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doistbot --version")
  end
end
