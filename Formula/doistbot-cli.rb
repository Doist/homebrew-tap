class DoistbotCli < Formula
  desc "Local self-review CLI for Doistbot"
  homepage "https://github.com/Doist/doistbot-app"
  # doistbot-cli-tarball-url
  url "https://registry.npmjs.org/@doist/doistbot-cli/-/doistbot-cli-1.0.13.tgz"
  # doistbot-cli-tarball-sha256
  sha256 "c824da1b4c04e4986a2f25c9563f28d6d67857bef954b4344b9aaf37cebb0601"
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
