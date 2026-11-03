class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.0/kividb-darwin-aarch64.tar.gz"
      sha256 "cb70314a5832c01f4bf366d3044a6e2ea37dfe8631aead93095434f68b13d41d"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.0/kividb-darwin-x86_64.tar.gz"
      sha256 "02f4268dbc969bdc6c5b78bd1e88e9accd2083eb2e0075a0a1ff47a639dcfef3"
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
