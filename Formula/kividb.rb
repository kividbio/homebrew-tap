class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "0.1.13"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v0.1.13/kividb-darwin-aarch64.tar.gz"
      sha256 "fbdddcb3758a3167abb19977c30176d9b958927970838a4e4d982cfa04c699bb"
    end
    on_intel do
      url "https://releases.kividb.io/v0.1.13/kividb-darwin-x86_64.tar.gz"
      sha256 "f7c42049dc7740b7a8c80ddef29a83b066a09ab805ad4d65cd738af27c494d89"
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
