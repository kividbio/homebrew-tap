class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.0/kividb-darwin-aarch64.tar.gz"
      sha256 "f1a9b97758f2f134a45ed18d377de7f9ba9d7d241ec6eacdec41756e07513bb9"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.0/kividb-darwin-x86_64.tar.gz"
      sha256 "5faee0bce7ffd983245f1fb79d66a3d6b215ca97577403d5002b58ada422f4cb"
    end
  end

  def install
    bin.install "kividb"
    doc.install "LICENSE", "NOTICE"
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
