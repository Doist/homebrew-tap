class DoistbotCli < Formula
  desc "Local self-review CLI for Doistbot"
  homepage "https://github.com/Doist/doistbot-app"
  # doistbot-cli-tarball-url
  url "https://registry.npmjs.org/@doist/doistbot-cli/-/doistbot-cli-1.0.9.tgz"
  # doistbot-cli-tarball-sha256
  sha256 "51fe6aaafc3105cd80cec33dbef7463a71ceae0019e91a3b3f4e0bc7c296ec22"
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
