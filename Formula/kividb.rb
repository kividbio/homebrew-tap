class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc3"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc3/kividb-darwin-aarch64.tar.gz"
      sha256 "e174b6d9e397f3c5e3188b2c41305d68934cd47e7405cc431c6280b42e1b626f"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc3/kividb-darwin-x86_64.tar.gz"
      sha256 "94483282119cd3632607d7488b4ef6f08f64dcdbf0386a67d3020f7492e9db3f"
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
