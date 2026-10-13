class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.5"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.5/kividb-darwin-aarch64.tar.gz"
      sha256 "b7ece9cf55775a6c541004293d90273175218dc2e6995b23ec4169986e510850"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.5/kividb-darwin-x86_64.tar.gz"
      sha256 "450b64b7d7355fb6c7881f8a19a862b84fcde351bd97552383efa98f447532e1"
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
