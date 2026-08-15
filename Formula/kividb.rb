class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.4-rc2"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.4-rc2/kividb-darwin-aarch64.tar.gz"
      sha256 "e14ff7f80b08cd99968829ae92c45c4f61b7758e0595efc671fc0b2d99a246cb"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.4-rc2/kividb-darwin-x86_64.tar.gz"
      sha256 "4a87d02f0bb8e4027a194ba3a12c3217e66e6e0a52fe117e7975a8e5b31afad4"
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
