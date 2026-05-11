class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.0"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.0/kividb-darwin-aarch64.tar.gz"
      sha256 "064cb6d8c8d455c8fddd105c694accb02611b3bb77f620730f594aa93068e965"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.0/kividb-darwin-x86_64.tar.gz"
      sha256 "b05fa8c395191f794d5e87b6b742d1467f002b6b852d891bc84b4b11a8ba0ec0"
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
