class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "0.1.16"
  
  on_macos do
    on_arm do
      url "https://releases.kividb.io/v0.1.16/kividb-darwin-aarch64.tar.gz"
      sha256 "11997f2164548542231e735122a63c14a511ddd34929e6611edc357431dd7643"
    end
    on_intel do
      url "https://releases.kividb.io/v0.1.16/kividb-darwin-x86_64.tar.gz"
      sha256 "215d538564939559a60454ded0609aa11924aa4bf9fa2dd7f30513f5e43b9d24"
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
