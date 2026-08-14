class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-aarch64.tar.gz"
      sha256 "0e538b6704232dde26bc8051b16c483b6694c0c54507feb08cdb29c716a370a5"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc1/kividb-darwin-x86_64.tar.gz"
      sha256 "03e20d3340898b317e1dd7e2d673e860311fd1fdb502ab28498c85d337e3d2a4"
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
