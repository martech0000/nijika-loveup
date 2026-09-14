# にじかモテコンサル LP

GitHub Pagesで公開できる静的ランディングページです。

## ファイル構成

- `index.html`：LP本体
- `styles.css`：表示幅、つなぎ目グラデーション、CTAリンク領域
- `assets/`：LP画像7枚
- `.nojekyll`：GitHub PagesでJekyll処理を行わないためのファイル
- `set-cta-url.ps1`：申込み先URLを2つのCTAへ一括設定するスクリプト
- `GITHUB_PUBLISH_GUIDE.md`：公開手順

## 公開前に行うこと

現在、ファーストビューと最終セクションのCTAリンクは `#` です。申込み先が決まったら、PowerShellで次を実行してください。

```powershell
.\set-cta-url.ps1 -Url "https://example.com/reservation"
```

実行後、`index.html` 内の2つのCTAが指定URLへ変更されます。

## ローカル確認

`index.html` をブラウザで開くと確認できます。

## 公開方法

詳しくは [GITHUB_PUBLISH_GUIDE.md](./GITHUB_PUBLISH_GUIDE.md) を確認してください。
