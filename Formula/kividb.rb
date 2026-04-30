class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "0.1.14"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v0.1.14/kividb-darwin-aarch64.tar.gz"
      sha256 "00bfdaf716329fbbb87953008f346aa3d99c1d887f9c22b1d5f22a59777dfb51"
    end
    on_intel do
      url "https://releases.kividb.io/v0.1.14/kividb-darwin-x86_64.tar.gz"
      sha256 "006446a8cad043a4ec0c95891c1cf9efaf15e57f7fce192cf6eb9cc3009b2deb"
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
