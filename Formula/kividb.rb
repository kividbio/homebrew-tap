class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.2"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.2/kividb-darwin-aarch64.tar.gz"
      sha256 "a91d2e3623241557b07956c61878466dabbabbf45bbd6add2b6cc6e0ce6b6d92"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.2/kividb-darwin-x86_64.tar.gz"
      sha256 "289eedb558d5e605679d721eddc6900aad9c9616cd1768617054dead657a810e"
    end
  end

  def install
    bin.install "kividb"
    doc.install "LICENSE"
  end

  service do
    run [opt_bin/"kividb"]
    keep_alive true
    log_path var/"log/kividb.log"
    error_log_path var/"log/kividb.error.log"
  end

  test do
    system "#{bin}/kividb", "--version"
  end
end
