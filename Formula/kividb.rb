class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-aarch64.tar.gz"
      sha256 "e7e5366b7173d614a06abce2ddcae9a7ff08417a3240d18371340e8d97bf94f7"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-x86_64.tar.gz"
      sha256 "5b77c9722e69afa522c17c38ea9ef63d1b60cdebabea29448144400c9de76be9"
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
