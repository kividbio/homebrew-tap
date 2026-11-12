class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.2.2"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.2/kividb-darwin-aarch64.tar.gz"
      sha256 "bf19dc7e3a20edab5612fd67212e22378721a57eea6a7ba1f2cf20c2702f38df"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.2/kividb-darwin-x86_64.tar.gz"
      sha256 "27f6c4a69c2e2ab654836ad16ea43a13969e8563cdab0141524a0e5759533810"
    end
  end

  def install
    bin.install "kividb"
    doc.install "LICENSE", "NOTICE"
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
