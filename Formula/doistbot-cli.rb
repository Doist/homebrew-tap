class DoistbotCli < Formula
  desc "Local self-review CLI for DoistBot"
  homepage "https://github.com/Doist/doistbot-app"
  # doistbot-cli-tarball-url
  url "https://registry.npmjs.org/@doist/doistbot-cli/-/doistbot-cli-1.0.1.tgz"
  # doistbot-cli-tarball-sha256
  sha256 "8636dc9ef6f7cc47a4bc51c426fce242457cee861044a4bb3682c3c342f209ad"
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
  end
end
