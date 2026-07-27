class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.3/kividb-darwin-aarch64.tar.gz"
      sha256 "6e85055e7498922f45643a039ba7eb34f465d5984f0d751bb9ef604b4b06e89d"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.3/kividb-darwin-x86_64.tar.gz"
      sha256 "1a116503abcb932b63796a2ffbbaaccb5ec76a67adcd5112fa09163e2781aff3"
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
