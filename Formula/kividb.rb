class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.1.2"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.2/kividb-darwin-aarch64.tar.gz"
      sha256 "ec3cfdff0eab14501994a22a1830928ffe02d850a4e8ee1c4810bc78e14ee143"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.2/kividb-darwin-x86_64.tar.gz"
      sha256 "e05a27c5301092ac9504e15c42fbe79c0e8204506b147ba42dc86a380e430835"
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
