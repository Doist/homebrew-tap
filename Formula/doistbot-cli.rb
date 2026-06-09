class DoistbotCli < Formula
  desc "Local self-review CLI for Doistbot"
  homepage "https://github.com/Doist/doistbot-app"
  # doistbot-cli-tarball-url
  url "https://registry.npmjs.org/@doist/doistbot-cli/-/doistbot-cli-1.0.5.tgz"
  # doistbot-cli-tarball-sha256
  sha256 "e40d03bdb2992d75122a59b47ca319b6ce96eb88ff2a44b8406377d7cb967c41"
  license "UNLICENSED"

  depends_on "node"

  def install
    system Formula["node"].opt_bin/"npm", "install", *std_npm_args

    bin.mkpath
    libexec.glob("bin/*").each do |file|
      (bin/file.basename).write_env_script file, PATH: "#{Formula["node"].opt_bin}:$PATH"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doistbot --version")
    assert_match version.to_s, shell_output("#{bin}/db --version")
  end
end
