class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc3"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc3/kividb-darwin-aarch64.tar.gz"
      sha256 "1ea9268abf1271b5b132a1df5171eb4b535a876af8764e0b7f77f4f92bf9e179"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc3/kividb-darwin-x86_64.tar.gz"
      sha256 "8e988645e4057560a68f2976326fc50f9882425f83ee90b46e3b0f21e9563a81"
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
