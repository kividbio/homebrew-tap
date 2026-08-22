class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4/kividb-darwin-aarch64.tar.gz"
      sha256 "bcaf0d3cc76145e615b6744d1dc584f42f327002e7d7d213a2c612c5d0d168f4"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4/kividb-darwin-x86_64.tar.gz"
      sha256 "eecd4698034104154708bc19424fae5d49dec806755b7a75ebd7c6f862d683db"
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
