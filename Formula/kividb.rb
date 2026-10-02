class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.5-rc1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.5-rc1/kividb-darwin-aarch64.tar.gz"
      sha256 "00d19bb5062350ebf67b092898f5c01080c07333ba0beba4aa8f72cd94d1ba93"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.5-rc1/kividb-darwin-x86_64.tar.gz"
      sha256 "aaa111095c538ebe7d34a705f8fe905a2cecd0d262c69033dc409425cf41bcde"
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
