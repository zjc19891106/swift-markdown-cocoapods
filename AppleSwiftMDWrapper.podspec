Pod::Spec.new do |s|
    s.name             = "AppleSwiftMDWrapper"
    s.version          = "1.1.0"
    s.summary          = "CocoaPods wrapper for Apple's official swift-markdown library."
    s.description      = <<-DESC
                         Provides the Markdown module for parsing, building, editing, and analyzing Markdown documents.
                         Forked from apple/swift-markdown with CocoaPods support.
                         DESC
    s.homepage         = "https://github.com/zjc19891106/swift-markdown-cocoapods"
    s.license          = { :type => "Apache-2.0", :file => "LICENSE.txt" }
    s.author           = {
        "Apple" => "apple@apple.com",
        "zjc19891106" => "your@email.com"  # 替换成你的邮箱
    }

    s.source           = {
        :git => "https://github.com/zjc19891106/swift-markdown-cocoapods.git",
        :tag => "#{s.version}"
    }

    s.ios.deployment_target = "15.0"

    s.requires_arc = true
    s.module_name      = "Markdown"

    # 关键修复：调整为官方平级结构（*.swift 而非 **/*.swift）
    
    s.source_files = [
    "Sources/Markdown/**/*.swift",         # 递归匹配所有子目录下的 Swift 文件（关键！）
    "Sources/CAtomic/**/*.{h,c}",
    "swift-cmark/src/**/*.{h,c}",
    "swift-cmark/extensions/**/*.{h,c}"
]

    s.preserve_paths = [
        "README.md",
        "swift-cmark/src/*.inc",
        "swift-cmark/COPYING",
        "swift-cmark/README.md"
    ]

    # 如果编译需要（pleisto wrapper 有，可选加）
    # s.pod_target_xcconfig = { 'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'SWIFT_MARKDOWN_COCOA_PODS' }
end
