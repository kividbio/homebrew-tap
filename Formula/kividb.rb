class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.1/kividb-darwin-aarch64.tar.gz"
      sha256 "6cdbd434ee36b6743abd53bdb30ad49c2abe3b5884639fc255c357ebc9a12929"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.1/kividb-darwin-x86_64.tar.gz"
      sha256 "628c9663f3e138c09c673c83854ba2a42769f782ddf13d3e79aa5afd9e87f2b6"
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
