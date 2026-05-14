class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.0/kividb-darwin-aarch64.tar.gz"
      sha256 "603c89b6542cf5ad9b1d9c391a3af995598c234fe0893050cbbcc7e6fff40b00"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.0/kividb-darwin-x86_64.tar.gz"
      sha256 "ac7e0816264b75a56568bb5c8bf6f4bc443d0f3a83890e04003eaafeff4fe11a"
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
