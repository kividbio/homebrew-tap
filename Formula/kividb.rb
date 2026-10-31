class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.1.3"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.3/kividb-darwin-aarch64.tar.gz"
      sha256 "e7896c96816a3806ab99d6899252a9af29bafb27f59c2d2069ca3e32759b9232"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.3/kividb-darwin-x86_64.tar.gz"
      sha256 "9310cd34e8a9094c78162d7f6cef5e2427ac461f34471451cfeebd717acebc91"
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
