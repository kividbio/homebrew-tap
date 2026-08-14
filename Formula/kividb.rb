class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-aarch64.tar.gz"
      sha256 "4ee1e508ff5dae6a1507f0aa5ed0444397df2f85260dc0d36246101305d3274e"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-x86_64.tar.gz"
      sha256 "fa3996591581e2b0189314ff3e341e6ee0c624d3569054beab195a8ab02233f7"
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
