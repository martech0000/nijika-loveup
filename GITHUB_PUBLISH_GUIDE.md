# GitHub Pages 公開手順

## 最初に確認すること

- 公開用フォルダの中身だけを、新しいGitHubリポジトリへ入れる
- Obsidianフォルダ全体はアップロードしない
- 現在のCTAリンクは仮の `#`。申込み先URLが決まっている場合は先に変更する
- GitHub FreeでGitHub Pagesを使う場合は、公開リポジトリを選ぶ

## 方法A：GitHubの画面からアップロードする

### 1. 新しいリポジトリを作る

1. GitHubへログインする
2. 右上の `+` から `New repository` を選ぶ
3. Repository nameを `nijika-mote-consulting-lp` にする
4. Visibilityは `Public` を選ぶ
5. README、.gitignore、Licenseは追加せずに作成する

### 2. LPファイルを入れる

1. 作成したリポジトリで `uploading an existing file` を選ぶ
2. このフォルダ内のファイルと `assets` フォルダをアップロードする
3. `Commit changes` を押す

アップロード後、リポジトリ直下に次があることを確認する。

```text
index.html
styles.css
assets/
README.md
GITHUB_PUBLISH_GUIDE.md
```

### 3. GitHub Pagesを有効にする

1. リポジトリ上部の `Settings` を開く
2. 左側の `Pages` を開く
3. `Build and deployment` のSourceで `Deploy from a branch` を選ぶ
4. Branchを `main`、フォルダを `/(root)` にする
5. `Save` を押す

公開URLは通常、次の形式になる。

```text
https://あなたのGitHubユーザー名.github.io/nijika-mote-consulting-lp/
```

反映まで数分かかる場合がある。SettingsのPagesに表示される `Visit site` から確認する。

## 方法B：Gitコマンドでアップロードする

GitHub上で空の `nijika-mote-consulting-lp` リポジトリを作成した後、このフォルダでPowerShellを開き、次を順番に実行する。

```powershell
git init
git add .
git commit -m "Publish Nijika landing page"
git branch -M main
git remote add origin https://github.com/あなたのGitHubユーザー名/nijika-mote-consulting-lp.git
git push -u origin main
```

プッシュ後、方法Aの「3. GitHub Pagesを有効にする」を行う。

## CTAリンクの設定

公開前にPowerShellで次を実行する。

```powershell
.\set-cta-url.ps1 -Url "実際のLINE・予約フォーム・申込みページURL"
```

手動で変更する場合は、`index.html` 内にある2つの `href="#"` を同じ申込みURLへ変更する。

## 更新方法

画像やHTMLを修正した後、Gitを使っている場合は次を実行する。

```powershell
git add .
git commit -m "Update landing page"
git push
```

GitHub Pagesが自動的に再公開する。

## 公開確認

- [ ] ファーストビューが表示される
- [ ] 7枚の画像が欠けずに表示される
- [ ] セクションのつなぎ目にグラデーションが出る
- [ ] スマートフォンで横スクロールが発生しない
- [ ] 最初と最後のCTAが申込み先へ移動する
- [ ] 中腹の文章がボタンとして反応しない
- [ ] PCとスマートフォンの両方で確認した

## GitHub公式手順

- https://docs.github.com/pages/getting-started-with-github-pages/creating-a-github-pages-site
- https://docs.github.com/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
